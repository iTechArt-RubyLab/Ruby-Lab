#!/usr/bin/env ruby

# frozen_string_literal: true

file = File.open('data.txt', 'r')
data = file.read
file.close

EXIT_COMMAND = 'exit!'
ERROR_MESSAGE = 'City name can not be blank!'
DEFAULT_VALUE = -1.0

def extract_data(data_string)
  data_string.split("\n").each_with_object({}) do |data, city_rainfall_stats|
    town, rainfall_stats = data.split(':')
    city_rainfall_stats[town] = rainfall_stats.split(',').each_with_object([]) do |results, month_rainfall_stats|
      month_rainfall_stats << results.split(' ')[1]
    end
  end
end

@rainfall_data = extract_data(data)

def mean(town, data)
  return DEFAULT_VALUE unless data[town]

  data[town].sum(&:to_f) / 12
end

def variance(town, data)
  return DEFAULT_VALUE unless data[town]

  mean_value = mean(town, @rainfall_data)
  data[town].sum { |value| (value.to_f - mean_value)**2 } / 12
end

def run_cli
  loop do
    puts 'Enter city name:'
    input = gets.chomp
    break if input == EXIT_COMMAND

    if input.empty?
      puts ERROR_MESSAGE
    else
      puts "Rainfall mean: #{mean(input, @rainfall_data)}"
      puts "Rainfall variance: #{variance(input, @rainfall_data)}"
    end
  end
end

run_cli
