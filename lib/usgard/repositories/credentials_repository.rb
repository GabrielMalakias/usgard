class CredentialsRepository < Hanami::Repository
  associations do
    belongs_to :users
  end

  def find_by_credentials(user_params, password)
    model = aggregate(:users).join(:users).where(email: user_params[:auth_key]).first
    SCrypt::Password.new(model.crypted_password) == password ? model : nil
  end
end

