# HEROKU SETTINGS
require('pg')

class SqlRunner

  def self.run( sql, values = [] )
    begin
      db = PG.connect({ dbname: 'd3l8rgdkmgagr1',
        host: 'ec2-54-227-245-146.compute-1.amazonaws.com', port: 5432,
        user: 'ltoguetmjnvipt', password: '8878d9c2c192d44996d3c5cac2255334239a09e813b2dccaadbe0743e6f6856c' })
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
