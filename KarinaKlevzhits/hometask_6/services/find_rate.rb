# frozen_string_literal: true

require 'pg'
require_relative 'currency_queries'
# class FindRate
class FindRate
  include CurrencyQueries
  def initialize(currency, limit)
    @currency = currency
    @limit = limit
  end

  def call
    con = PG.connect dbname: 'my_db', user: 'karina'

    rs = con.exec(top_by_currency(currency, limit))

    rs.each do |row|
      puts format('%s', row['difference'])
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
