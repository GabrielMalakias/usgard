# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
get '/', to: 'home#index'

resources 'sensors' do
  get '/',    to: 'sensors#index'
  get '/:id', to: 'sensors#show'
end

