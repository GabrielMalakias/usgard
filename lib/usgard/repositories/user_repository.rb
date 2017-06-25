class UserRepository < Hanami::Repository
  associations do
    has_many :credentials
  end

  def create_with_credentials(data)
    assoc(:credentials).create(data)
  end

  def auth!(auth_hash)
    info = auth_hash[:info]
    external_id = auth_hash[:uid]
    provider = auth_hash[:provider]
    attrs = {
      name:   info[:name],
      email:  info[:email],
    }

    user = aggregate(:credentials).join(:credentials).
      where(external_id: external_id, provider: provider).
      one

    if user
      update(user.id, attrs)
    else
      create_with_credentials(attrs.merge(credentials: [{external_id: external_id, provider: provider}]))
    end
  end

  def find_by_email(email)
    conditions = { email: email, credentials__provider: 'self' }
    aggregate(:credentials).join(:credentials).where(conditions).as(User).one
  end
end

