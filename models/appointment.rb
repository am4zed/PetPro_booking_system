require_relative('../db/sql_runner')

class Appointment
  attr_reader :id, :appt_date, :appt_time, :service,
  :length_in_mins, :pet_id

  def initialize(options)
    @id = options['id'] if options['id']
    @pet_id = options['pet_id']
    @service = options['service']
    @appt_date = options['appt_date']
    @appt_time = options['appt_time']
    @length_in_mins = options['length_in_mins']
  end

  def save
    sql = 'INSERT INTO appointments (pet_id, service, appt_date, appt_time, length_in_mins)
    VALUES ($1, $2, $3, $4, $5) RETURNING *'
    values = [@pet_id, @service, @appt_date, @appt_time, @length_in_mins]
    results = SqlRunner.run(sql,values)
    @id = results.first['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM appointments
    ORDER BY appt_date'
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

  def update()
    sql = 'UPDATE appointments SET (pet_id, service, appt_date, appt_time, length_in_mins) =
    ($1, $2, $3, $4, $5) WHERE id = $6'
    values = [@pet_id, @service, @appt_date, @appt_time, @length_in_mins, @id]
    SqlRunner.run(sql,values)
  end

  def delete()
    sql = 'DELETE FROM appointments
    WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def self.appointments_by_service(service)
    sql = 'SELECT * FROM appointments WHERE service = $1'
    values = [service]
    results = SqlRunner.run(sql,values)
    results.map { |appointment| Appointment.new(appointment)  }
  end

  def check_availability?
    sql = 'SELECT * FROM appointments'
    results = SqlRunner.run(sql)
    appointments = results.map { |appointment| Appointment.new(appointment)  }
    for appointment in appointments
      if appointment.appt_date == @appt_date && appointment.appt_time == @appt_time
        return false
      end
    end
    return true
  end

end
