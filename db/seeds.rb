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
  'neutered_or_spayed' => 'Yes',
  'photo' => 'https://www.google.com/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwjb4ej78JrhAhVqyoUKHXcyB00QjRx6BAgBEAU&url=https%3A%2F%2Fwww.101dogbreeds.com%2Fjack-a-poo.asp&psig=AOvVaw3WC_CC0VWFLO7vqvffI5OT&ust=1553520491048344'
  })
pet1.save()

pet2 = Pet.new({
  'name' => 'Baxter',
  'owner_name' => 'Kerry',
  'type' => 'dog',
  'breed' => 'Border-Lakeland Terrier',
  'gender' => 'male',
  'age' => 3,
  'neutered_or_spayed' => 'Yes',
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

appointment2 = Appointment.new({
  'appt_date' => '01/04/19',
  'appt_time' => '10:00',
  'service' => 'groom',
  'length_in_mins' => 120,
  'pet_id' => 1
  })
appointment2.save()
