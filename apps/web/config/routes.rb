get '/', to: 'home#index'
get '/login', to: 'home#login', as: :login

resources 'sensors'
resources 'actuators'

get '/sign_in', to: 'users#sign_in'

get '/users/new', to: 'users#new'
post 'users', to: 'users#register', as: :register

get '/logout', to: 'session#destroy'

get '/auth/:provider/callback', to: 'session#create'
post '/auth/:provider/callback', to: 'session#create'
