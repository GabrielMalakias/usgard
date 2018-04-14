module Web::Views::Users
  class SignIn
    include Web::View

    layout :login

    def form
      form_for :user, '/auth/hanami/callback' do
        div(class: 'row input-field')  do
          label :email, for: :email
          text_field :email, class: 'validate'
        end

        div(class: 'row input-field')  do
          label :password, for: :password
          password_field :password
        end

        div(class: 'row')  do
          submit 'Sign In', class: 'btn teal darken-4 waves-effect waves-light'
          a 'Back', href: '/', class: 'btn grey'
        end
      end
    end
  end
end
