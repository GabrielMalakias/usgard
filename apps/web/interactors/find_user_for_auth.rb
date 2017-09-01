require 'hanami/interactor'

class FindUserForAuth
  include Hanami::Interactor

  expose :user

  def initialize(login, password)
    @login = login
    @password = password
  end

  def call
    user = UserRepository.new.find_by_email(@login)
    if user && user.credentials.first && SCrypt::Password.new(user.credentials.first.crypted_password) == @password
      @user = user
    else
     fail!
    end
  end
end
