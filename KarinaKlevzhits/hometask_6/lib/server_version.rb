# frozen_string_literal: true

require 'pg'

begin
  con = PG.connect dbname: 'my_db', user: 'karina'
  puts con.server_version
rescue PG::Error => e
  puts e.message
ensure
  con&.close
end
