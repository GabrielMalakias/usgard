module Usgard
  module Commands
    module User
      module Password
        class Manager
          def user_pass(user)
            SCrypt::Password.new(first_user_credentials(user))
          end

          def encrypt(string)
            SCrypt::Password.create(string)
          end

          private

          def first_user_credentials(user)
            user.credentials.first.crypted_password
          end
        end
      end
    end
  end
end

