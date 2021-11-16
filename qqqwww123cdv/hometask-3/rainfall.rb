#!/usr/bin/env ruby
# frozen_string_literal: true

def data
  file = File.new('data.txt', 'r:UTF-8')
  file.read
end

def weather_data(town, data)
  monthly_rainfall = data.split("\n").find { |data_row| data_row.match "#{town}:" }
  return if monthly_rainfall.nil?

  monthly_rainfall.scan(/\d*\.\d/).map(&:to_f)
end

def mean(town, data)
  rainfall_values = weather_data(town, data)
  return -1.0 if rainfall_values.nil?

  rainfall_values.sum / rainfall_values.length
end

def variance(town, data)
  average_rainfall = mean(town, data)
  return -1.0 if average_rainfall == -1

  rainfall_values = weather_data(town, data)
  rainfall_values.map { |data_row| (average_rainfall - data_row)**2 }.sum / rainfall_values.length
end

def show_mean_and_variance(town)
  puts "Rainfall mean: #{mean(town, data)}"
  puts "Rainfall variance: #{variance(town, data)}"
end

def run_cli
  loop do
    puts 'Enter city name: '
    str = gets.chomp
    break if str == 'exit!'

    if str.empty?
      puts 'Error, line is empty!'
    else
      show_mean_and_variance(str)
    end
  end
end
run_cli
