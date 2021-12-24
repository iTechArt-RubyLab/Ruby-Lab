# frozen_string_literal: true

require 'pg'
# class DataRecorder
class DataRecorder
  attr_accessor :currencies

  def initialize(currencies)
    @currencies = currencies
  end

  def call
    clear_data
    create_currencies_table
    insert_data
  rescue PG::Error => e
    puts e.message
  ensure
    con&.close
  end

  private

  def con
    @con ||= PG.connect dbname: 'my_db', user: 'karina'
  end

  def clear_data
    con.exec 'DROP TABLE IF EXISTS Currencies'
  end

  def create_currencies_table
    con.exec "CREATE TABLE Currencies(Id SERIAL PRIMARY KEY,
    time DATE,currency VARCHAR, rate DECIMAL)"
  end

  def insert_data
    currencies.each do |currency_item|
      time, currency, rate  = currency_item.values_at(:time, :currency, :rate)
      con.exec "INSERT INTO Currencies (time,currency,rate) VALUES ('#{time}','#{currency}','#{rate}')"
    end
  end
end
