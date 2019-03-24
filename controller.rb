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
  erb (:pets_index)
end

get '/petpro/pets/new' do
  erb (:new_pet)
end


get '/petpro/pets/:id' do
  @pet = Pet.find(params['id'].to_i)
  erb (:show_pet)
end

get '/petpro/pets/:id/edit' do
  @pets = Pet.all()
  @pet = Pet.find(params['id'].to_i)
  erb(:edit_pet)
end

get '/petpro/appointments' do
  @appointments = Appointment.all()
  erb (:appointments_index)
end

get '/petpro/appointments/new' do
  @pets = Pet.all()
  erb (:new_appointment)
end

get '/petpro/appointments/:id' do
  @appointment = Appointment.find(params['id'].to_i)
  erb (:show_appointment)
end

post '/petpro/pets' do
  pet = Pet.new(params)
  pet.save
  redirect to '/petpro/pets'
end

post '/petpro/pets/:id' do
  pet = Pet.new(params)
  pet.update
  redirect to "/petpro/pets/#{params['id']}"
end

post '/petpro/pets/:id/delete' do
  pet = Pet.find(params['id'])
  pet.delete
  redirect to '/petpro/pets'
end

post '/petpro/appointments' do
  appointment = Appointment.new(params)
  appointment.save
  redirect to '/petpro/appointments'
end
