#!/usr/bin/env ruby
# frozen_string_literal: true

ENTER_MESSAGE = 'Enter city name: '
ERROR_MESSAGE = 'City name can not be blank!'
EXIT_MESSAGE = 'exit!'
NUMBER_OF_MONTHS = 12

def data_extraction
  file = File.new('data.txt')
  file.read
end

def mean(town, data)
  return -1 unless data.include?(town)

  search_town(town, data).sum / NUMBER_OF_MONTHS
end

def variance(town, data)
  return -1 unless data.include?(town)

  search_town(town, data).map { |city| (mean(town, data) - city)**2 }.sum / NUMBER_OF_MONTHS
end

def search_town(town, data)
  data.split("\n").each do |city|
    return city.scan(/\d*\.\d/).map(&:to_f) if city.include?(town)
  end
end

def run_cli
  loop do
    puts ENTER_MESSAGE
    string = gets.chomp
    exit if string == EXIT_MESSAGE

    string.empty? ? puts(ERROR_MESSAGE) : show_result(string)
  end
end

def show_result(input)
  puts "Rainfall mean: #{mean(input, data_extraction)}"
  puts "Rainfall variance: #{variance(input, data_extraction)}"
end

run_cli
