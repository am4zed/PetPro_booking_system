require_relative('../db/sql_runner')

class Pet
  attr_reader :id, :name, :owner_name, :type,
  :breed, :gender, :age, :neutered_or_spayed, :photo

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

  def save()
    sql = 'INSERT INTO pets (name, owner_name, type, breed, gender, age, neutered_or_spayed, photo)
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING *'
    values = [@name, @owner_name, @type, @breed, @gender, @age, @neutered_or_spayed, @photo]
    results = SqlRunner.run(sql,values)
    @id = results.first['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM pets'
    results = SqlRunner.run(sql)
    results.map { |pet| Pet.new(pet)  }
  end

  def self.find(id)
    sql = 'SELECT * FROM pets
    WHERE id = $1'
    values = [id]
    results = SqlRunner.run(sql, values)
    return Pet.new(results.first)
  end

  def update()
    sql = 'UPDATE pets SET (name, owner_name, type, breed, gender, age, neutered_or_spayed, photo) =
    ($1, $2, $3, $4, $5, $6, $7, $8)
    WHERE id = $9'
    values = [@name, @owner_name, @type, @breed, @gender, @age, @neutered_or_spayed, @photo, @id]
    SqlRunner.run(sql,values)
  end

  def delete()
    sql = 'DELETE FROM pets
    WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql,values)
  end

  # def appointments()
  #   sql = 'SELECT * FROM appointments WHERE pet_id = $1'
  #   values = [@id]
  #   results = SqlRunner.run(sql,values)
  #   return results.map { |appointment| Appointment.new(appointment)  }
  # end


end
