require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/pet.rb' )
require_relative( './models/appointment.rb' )
also_reload( './models/*' )

get '/petpro' do #HOME
  erb (:home)
end

get '/petpro/pets' do #INDEX
  @pets = Pet.all()
  erb (:pets_index)
end

get '/petpro/pets/new' do #NEW
  erb (:new_pet)
end


get '/petpro/pets/:id' do #SHOW
  @pet = Pet.find(params['id'].to_i)
  erb (:show_pet)
end

get '/petpro/pets/:id/edit' do #UPDATE
  @pets = Pet.all()
  @pet = Pet.find(params['id'].to_i)
  erb(:edit_pet)
end

get '/petpro/appointments' do #INDEX
  @appointments = Appointment.all()
  erb (:appointments_index)
end

get '/petpro/appointments/new' do #NEW
  @pets = Pet.all()
  erb (:new_appointment)
end

get '/petpro/appointments/:id' do #SHOW
  @appointment = Appointment.find(params['id'].to_i)
  erb (:show_appointment)
end

get '/petpro/appointments/:id/edit' do #UPDATE
  @appointments = Appointment.all()
  @appointment = Appointment.find(params['id'].to_i)
  erb(:edit_appointment)
end

post '/petpro/pets' do #CREATE
  pet = Pet.new(params)
  pet.save
  redirect to '/petpro/pets'
end

post '/petpro/pets/:id' do #UPDATE
  pet = Pet.new(params)
  pet.update
  redirect to "/petpro/pets/#{params['id']}"
end

post '/petpro/pets/:id/delete' do #DELETE
  pet = Pet.find(params['id'])
  pet.delete
  redirect to '/petpro/pets'
end

post '/petpro/appointments' do #CREATE
  appointment = Appointment.new(params)
  appointment.save
  redirect to '/petpro/appointments'
end

post '/petpro/appointments/:id' do #UPDATE
  Appointment = Appointment.new(params)
  Appointment.update
  redirect to "/petpro/appointments/#{params['id']}"
end

post '/petpro/appointments/:id/delete' do #DELETE
  appointment = Appointment.find(params['id'])
  appointment.delete
  redirect to '/petpro/appointments'
end
