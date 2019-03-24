require_relative('../db/sql_runner')

class Appointment
  attr_reader :id, :appt_date, :appt_time, :service,
  :length_in_mins, :pet_id
  def initialize(options)
    @id = options['id'] if options['id']
    @appt_date = options['appt_date']
    @appt_time = options['appt_time']
    @service = options['service']
    @length_in_mins = options['length_in_mins']
    @pet_id = options['pet_id']
  end

  def save
    sql = 'INSERT INTO appointments (appt_date, appt_time, service, length_in_mins, pet_id)
    VALUES ($1, $2, $3, $4, $5) RETURNING *'
    values = [@appt_date, @appt_time, @service, @length_in_mins, @pet_id]
    results = SqlRunner.run(sql,values)
    @id = results.first['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM appointments'
    results = SqlRunner.run(sql)
    results.map { |appointment| Appointment.new(appointment)  }
  end

  def self.find(id)
    sql = 'SELECT * FROM appointments
    WHERE id = $1'
    values = [id]
    results = SqlRunner.run(sql, values)
    return Appointment.new(results.first)
  end

end
