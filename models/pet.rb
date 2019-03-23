require_relative('../db/sql_runner')

class Pet
  def initialize(options)
    @id = options['id'] if options['id']
    @name = options['name']
    @owner_name = options['owner_name']
    @type = options['type']
    @breed = options['breed']
    @gender = options['gender']
    @age = options['age']
    @neutered_or_spayed = options['neutered_or_spayed']
    @photo = options['photo']
  end

  def save
    sql = 'INSERT INTO pets (name, owner_name, type, breed, gender, age, neutered_or_spayed, photo)
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8)'
    values = [@name, @owner_name, @type, @breed, @gender, @age, @neutered_or_spayed, @photo]
    results = SqlRunner.run(sql,values)
    @id = results.first['id'].to_i
  end


end
