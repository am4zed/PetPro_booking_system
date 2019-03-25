require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/pet.rb' )
require_relative( '../models/appointment.rb' )
also_reload( '../models/*' )

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
