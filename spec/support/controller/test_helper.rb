module Usgard
  module Controller
    module TestHelper
      def stub_current_user!(user = double(User))
        allow_any_instance_of(Web::Authentication).to receive(:current_user).and_return(user)
      end
    end
  end
end
