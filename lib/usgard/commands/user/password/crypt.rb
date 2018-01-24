module Usgard
  module Commands
    module User
      module Password
        class Crypt
          def call(user)
            SCrypt::Password.new(first_user_credentials(user))
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

