require_relative('../models/pet')
require_relative('../models/appointment')
require('pry-byebug')

pet1 = Pet.new({
  'name' => 'Ozzy',
  'owner_name' => 'Amy',
  'type' => 'dog',
  'breed' => 'Jackadoodle',
  'gender' => 'male',
  'age' => 3,
  'neutered_or_spayed' => true,
  'photo' => 'ozzy_pic'
  })
pet1.save()
