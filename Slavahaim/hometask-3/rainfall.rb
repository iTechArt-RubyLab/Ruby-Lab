#!/usr/bin/env ruby
# frozen_string_literal: true

EXIT_STATE = 'Exit!'
ERROR_MESSAGE = 'String can not be blank'

def data_extract
  file = File.new('data.txt', 'r:UTF-8')
  file.read
end

def parse_data(town, str)
  match = str.match(/#{town}:Jan (.*)/)
  match.nil? ? [] : match[1].split(/,\w+\s/).map(&:to_f)
end

def mean(town, strng)
  numbers = parse_data(town, strng)
  return -1 if numbers.nil?

  numbers.sum / 12
end

def variance(town, strng)
  numbers = parse_data(town, strng)
  return -1 if numbers.nil?

  mean = numbers.sum / 12
  numbers.map { |num| (num - mean)**2 }.sum / 12
end

def show_results(in_city)
  puts "Rainfall mean: #{mean(in_city, data_extract)}"
  puts "Rainfall variance: #{variance(in_city, data_extract)}"
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
