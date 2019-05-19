require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/pet.rb' )
require_relative( '../models/appointment.rb' )
also_reload( '../models/*' )


get '/petpro/pets' do #INDEX
  @pets = Pet.all()
  erb (:"pets/index")
end

get '/petpro/pets/new' do #NEW
  erb (:"pets/new")
end

get '/petpro/pets/:id' do #SHOW
  @pet = Pet.find(params['id'].to_i)
  erb (:"pets/show")
end

get '/petpro/pets/:id/edit' do #UPDATE
  @pets = Pet.all()
  @pet = Pet.find(params['id'].to_i)
  @types = ['Dog', 'Cat', 'Rodent', 'Exotic', 'Other']
  @genders = ['Male', 'Female']
  @neutered_or_spayed_options = ['Yes', 'No']
  erb(:"pets/edit")
end

get '/petpro/pets/:id/appointments' do
  @pet = Pet.find(params['id'].to_i)
  @pet_appointments = @pet.appointments
  @services = ['walk', 'groom', 'visit']
  erb(:"pets/appointments")
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
