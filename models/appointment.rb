require_relative('../db/sql_runner')

class Appointment
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
end
