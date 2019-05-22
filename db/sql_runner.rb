# HEROKU SETTINGS
require('pg')

class SqlRunner

  def self.run( sql, values = [] )
    begin
      db = PG.connect({
        dbname: ENV['d4trtfh5g4qb8r'],
        host: ENV['ec2-174-129-242-183.compute-1.amazonaws.com'],
        port:  ENV[5432],
        user: ENV['bmehnvrreifrxj'],
        password: ENV['74f07137bafe772f5985554c8321a1d66cfdd03c56dd311c44a9bb319ec1f9c1']
        })
        db.prepare("query", sql)
        result = db.exec_prepared( "query", values )
      ensure
        db.close() if db != nil
      end
      return result
    end

  end


  # LOCALHOST SETTINGS
  # require('pg')
  #
  # class SqlRunner
  #
  #   def self.run( sql, values = [] )
  #     begin
  #       db = PG.connect({ dbname: 'pet_pro', host: 'localhost' })
  #       db.prepare("query", sql)
  #       result = db.exec_prepared( "query", values )
  #     ensure
  #       db.close() if db != nil
  #     end
  #     return result
  #   end
  #
  # end
