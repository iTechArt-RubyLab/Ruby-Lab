#!/usr/bin/env ruby

# frozen_string_literal: true

TEXT_SEPARATOR = "\n"
NUMB_OF_MONTHS = 12
REGEXP_FOR_CITY =/\w+:/.freeze
REGEXP_FOR_RAINFALL = /([0-9-]+\.[0-9])/.freeze
FILE_NAME = 'take_data.txt'

# get avg and var from rainfall
class Rainfall
  def initialize
    @user_input = user_input
    init_city_and_values
  end

  def run_cli
    return if @user_input == 'exit!'

    if @user_input.empty?
      puts 'Mistake!!!'
    else
      puts process_city

    end

    repeat
  end

  private

  def process_city
    return -1 unless current_city

    "Rainfall mean: #{mean}\nRainfall variance: #{variance}"
  end

  def user_input
    puts 'Enter a string:'
    gets.chomp
  end

  def repeat
    @user_input = user_input
    @current_city = nil
    run_cli
  end

  def data
    File.new(FILE_NAME).read
  end

  def init_city_and_values
    @city_and_values = {}
    take_data
    data.split(TEXT_SEPARATOR).each do |string|
      city = REGEXP_FOR_CITY.match(string).to_s.delete(':')
      @city_and_values[city] = string.scan(REGEXP_FOR_RAINFALL).flatten.map(&:to_f)
    end
  end

  def current_city
    @current_city ||= @city_and_values[@user_input]
  end

  def mean
    current_city.sum / NUMB_OF_MONTHS
  end

  def variance
    avg = mean

    var = current_city.map { |city_value| (city_value - avg)**2 }
    var.sum / NUMB_OF_MONTHS
  end
end

total = Rainfall.new

total.run_cli
