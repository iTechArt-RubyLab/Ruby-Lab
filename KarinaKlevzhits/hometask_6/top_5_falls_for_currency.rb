#!/usr/bin/ruby
# frozen_string_literal: true

require 'open-uri'
require 'http'
require './services/data_loader'
require './services/data_parser'
require './services/find_rate'
require './services/data_recorder'
URL = 'https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml?d77b9d32811c6036126e2d3d784a0ee0'

# class Currency
class Currency
  def initialize(url)
    @url = url
  end

  def run_cli
    run
    loop do
      print 'Enter your currency: '
      @input_currency = gets.chomp

      break if input_currency == 'exit!'

      user_message
    end
  end

  private

  attr_accessor :url, :input_currency

  def run
    load_data
    parse_data
    record_data
  end

  def exist?(input_string)
    parse_data.any? { |i| i[:currency] == input_string }
  end

  def load_data
    DataLoader.new(url).call
  end

  def parse_data
    DataParser.new.call
  end

  def record_data
    DataRecorder.new(parse_data).call
  end

  def find_rate
    FindRate.new(input_currency, 10).call
  end

  def user_message
    if input_currency.empty?
      puts 'Currency can not be blank!'
    elsif !exist?(input_currency)
      puts 'Not found currency!'
    else
      find_rate
    end
  end
end
Currency.new(URL).run_cli
