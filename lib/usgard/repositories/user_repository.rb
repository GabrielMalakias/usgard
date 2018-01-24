class UserRepository < Hanami::Repository
  associations do
    has_many :credentials
  end

  def create_with_credentials(data)
    assoc(:credentials).create(data)
  end

  def find_by_email(email)
    conditions = { email: email, credentials__provider: 'self' }
    aggregate(:credentials).join(:credentials).where(conditions).as(User).one
  end
end

