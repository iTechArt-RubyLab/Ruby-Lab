# frozen_string_literal: true

require 'pg'

begin
  con = PG.connect dbname: 'my_db', user: 'karina',
                   password: '1111'

  user = con.user
  db_name = con.db
  pswd = con.pass

  puts "User: #{user}"
  puts "Database name: #{db_name}"
  puts "Password: #{pswd}"
rescue PG::Error => e
  puts e.message
ensure
  con&.close
end
