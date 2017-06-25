module Web::Views::Users
  class SignIn
    include Web::View

    layout :login

    def form
      form_for :user, '/auth/hanami/callback', class: 'col s4 offset-s4' do
        div(class: 'row input-field')  do
          label :email, for: :email
          text_field :email, class: 'validate'
        end

        div(class: 'row input-field')  do
          label :password, for: :password
          password_field :password
        end

        div(class: 'row')  do
          submit 'Sign in', class: 'btn teal darken-4 waves-effect waves-light'
          a 'Sign up', href: 'users/new', class: 'btn grey'
        end
      end
    end
  end
end
