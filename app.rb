require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative('controllers/pets_controller')
require_relative('controllers/appointments_controller')
require_relative( './models/appointment.rb' )

get '/petpro' do #HOME
  @appointments = Appointment.all()
  erb (:home)
end
