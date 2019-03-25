require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/pet.rb' )
require_relative( '../models/appointment.rb' )
also_reload( '../models/*' )


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
