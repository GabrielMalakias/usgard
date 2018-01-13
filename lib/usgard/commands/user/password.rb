module Usgard
  module Commands
    module User
      class Password
        def encrypt(password)
          SCrypt::Password.create(password)
        end
      end
    end
  end
end
