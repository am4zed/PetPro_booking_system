require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/pet.rb' )
require_relative( './models/appointment.rb' )
also_reload( './models/*' )

get '/petpro' do
  erb (:home)
end

get '/petpro/pets' do
  @pets = Pet.all()
  erb (:pets)
end

get '/petpro/appointments' do
  # @appointments = Appointment.all()
  erb (:appointments)
end

get '/petpro/pets/new' do
  erb (:new_pet)
end

post '/petpro/pets' do
  pet = Pet.new(params)
  pet.save
  redirect to '/petpro/pets'
end

get '/petpro/appointments/new' do
  erb (:new_appointment)
end

post '/petpro/appointments' do
  appointment = Appointment.new(params)
  appointment.save
  redirect to '/petpro/appointments'
end
