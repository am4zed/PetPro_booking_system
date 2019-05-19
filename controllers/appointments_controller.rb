require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/pet.rb' )
require_relative( '../models/appointment.rb' )
also_reload( '../models/*' )

get '/petpro/appointments' do #INDEX
  @appointments = Appointment.all()
  erb (:"appointments/index")
end

get '/petpro/appointments/new' do #NEW
  @pets = Pet.all()
  @appointments = Appointment.all()
  erb (:"appointments/new")
end

get '/petpro/appointments/grooms' do
  @grooms = Appointment.appointments_by_service('groom')
  erb(:"appointments/grooms")
end

get '/petpro/appointments/walks' do
  @walks = Appointment.appointments_by_service('walk')
  erb(:"appointments/walks")
end

get '/petpro/appointments/visits' do
  @visits = Appointment.appointments_by_service('visit')
  erb(:"appointments/visits")
end

get '/petpro/appointments/:id' do #SHOW
  @appointment = Appointment.find(params['id'].to_i)
  erb (:"appointments/show")
end

get '/petpro/appointments/:id/edit' do #UPDATE
  @appointments = Appointment.all()
  @appointment = Appointment.find(params['id'].to_i)
  @pets = Pet.all()
  @times = ['09:00', '12:00', '15:00']
  @services = ['walk', 'groom', 'visit']
  erb(:"appointments/edit")
end

post '/petpro/appointments' do #CREATE
  # check DB to see if this date and time is available
  appointment = Appointment.new(params)
  if appointment.check_availability? == true
    appointment.save
    redirect to '/petpro/appointments'
  else
    erb (:"appointments/unavailable")
  end
end

post '/petpro/appointments/:id' do #UPDATE
  p params
  appointment = Appointment.new(params)
  appointment.update
  redirect to "/petpro/appointments/#{params['id']}"
end

post '/petpro/appointments/:id/delete' do #DELETE
  appointment = Appointment.find(params['id'])
  appointment.delete
  redirect to '/petpro/appointments'
end
