# HEROKU SETTINGS
require('pg')

class SqlRunner

  def self.run( sql, values = [] )
    begin
      db = PG.connect({
        dbname: ENV['DBNAME'],
        host: ENV['DBHOST'],
        port:  ENV['DBPORT'],
        user: ENV['DBUSER'],
        password: ENV['DBPASSWORD']
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
