require_relative('../models/pet')
require_relative('../models/appointment')

pet1 = Pet.new({
  'name' => 'Ozzy',
  'owner_name' => 'Amy',
  'type' => 'dog',
  'breed' => 'Jackadoodle',
  'gender' => 'male',
  'age' => 3,
  'neutered_or_spayed' => 'Yes'
  })
pet1.save()

pet2 = Pet.new({
  'name' => 'Baxter',
  'owner_name' => 'Kerry',
  'type' => 'dog',
  'breed' => 'Border-Lakeland Terrier',
  'gender' => 'male',
  'age' => 3,
  'neutered_or_spayed' => 'Yes'
  })
pet2.save()

appointment1 = Appointment.new({
  'pet_id' => 2,
  'service' => 'walk',
  'appt_date' => '2019-04-01',
  'appt_time' => '09:00',
  'length_in_mins' => 60,
  })
appointment1.save()

appointment2 = Appointment.new({
  'pet_id' => 1,
  'service' => 'groom',
  'appt_date' => '2019-04-01',
  'appt_time' => '12:00',
  'length_in_mins' => 120,
  })
appointment2.save()
