#!/usr/bin/env ruby
# frozen_string_literal: true

EXIT_STATE = 'Exit!'
ERROR_MESSAGE = 'String can not be blank'
NO_NUMBERS = -1
NUMBER_OF_MONTHS = 12

def extract_data
  file = File.new('data.txt', 'r:UTF-8')
  file.read
end

def parse_data(town, str)
  town_pattern = /#{town}:Jan (.*)/
  match = str.match(town_pattern)
  match.nil? ? [] : match[1].split(/,\w+\s/).map(&:to_f)
end

def mean(town, strng)
  numbers = parse_data(town, strng)
  return NO_NUMBERS if numbers.nil?

  numbers.sum / NUMBER_OF_MONTHS
end

def variance(town, strng)
  numbers = parse_data(town, strng)
  return NO_NUMBERS if numbers.nil?

  mean = numbers.sum / NUMBER_OF_MONTHS
  numbers.map { |num| (num - mean)**2 }.sum / NUMBER_OF_MONTHS
end

def show_results(in_city)
  puts "Rainfall mean: #{mean(in_city, extract_data)}"
  puts "Rainfall variance: #{variance(in_city, extract_data)}"
end

def run_cli
  loop do
    print 'Enter city name: '
    inputed_city = gets.strip.capitalize
    exit if inputed_city == EXIT_STATE
    if inputed_city.empty?
      puts ERROR_MESSAGE
    else
      show_results(inputed_city)
    end
  end
end

run_cli
