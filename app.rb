require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/pets_controller')
require_relative('controllers/appointments_controller')

get '/petpro' do #HOME
  erb (:home)
end
