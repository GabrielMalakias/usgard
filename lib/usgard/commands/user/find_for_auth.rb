require 'hanami/interactor'

module Usgard
  module Commands
    module User
      class FindForAuth
        include Hanami::Interactor

        expose :user

        def initialize(email, password)
          @email = email
          @password = password
        end

        def call
          @user = find_user_by_email.tap do |user|
            valid_password?(user) ? user : fail!
          end
        end

        private

        def repository
          UserRepository.new
        end

        def crypt
          Usgard::Commands::User::Password::Manager.new
        end

        def valid_password?(user)
          current_encrypted_password(user) == @password
        end

        def current_encrypted_password(user)
          crypt.user_pass(user)
        end

        def find_user_by_email
          repository.find_by_email(@email)
        end
      end
    end
  end
end

