# frozen_string_literal: true

require 'pg'

# class FindRate
class FindRate
  def initialize(currency, limit)
    @currency = currency
    @limit = limit
  end

  def call
    con = PG.connect dbname: 'my_db', user: 'karina'

    rs = con.exec "SELECT rate FROM  Currencies WHERE currency='#{currency}' ORDER BY rate DESC LIMIT #{limit}"

    rs.each do |row|
      puts format('%s', row['rate'])
    end
  rescue PG::Error => e
    puts e.message
  ensure
    rs&.clear
    con&.close
  end

  private

  attr_accessor :currency, :limit
end
