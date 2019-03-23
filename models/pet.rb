require_relative('../db/sql_runner')

class Pet
  def initialize(options)
    @id = options['id'] if options['id']
    @name = options['name']
    @owner_name = options['owner_name']
    @type = options['type']
    @gender = options['gender']
    @age = options['age']
    @neutered_or_spayed = options['neutered_or_spayed']
    @breed = options['breed']
    @photo = options['photo']
  end

  
end
