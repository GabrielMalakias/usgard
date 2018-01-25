class UserRepository < Hanami::Repository
  associations do
    has_many :credentials
  end

  def create_with_credentials(data)
    assoc(:credentials).create(data)
  end

  def find_by_email(email)
    aggregate(:credentials).where(email: email).as(User).one
  end
end

