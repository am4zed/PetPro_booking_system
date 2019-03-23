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

pet2 = Pet.new({
  'name' => 'Baxter',
  'owner_name' => 'Kerry',
  'type' => 'dog',
  'breed' => 'Border-Lakeland Terrier',
  'gender' => 'male',
  'age' => 3,
  'neutered_or_spayed' => true,
  'photo' => 'baxter_pic'
  })
pet2.save()

appointment1 = Appointment.new({
  'appt_date' => '01/04/19',
  'appt_time' => '09:00',
  'service' => 'walk',
  'length_in_mins' => 60,
  'pet_id' => 2
  })
appointment1.save()
