#!/usr/bin/env ruby
# frozen_string_literal: true

def data
  file = File.new('data.txt', 'r:UTF-8')
  file.read
end

def weather_data(town, data)
  data.split("\n").find do |value|
    if value.include? town
      monthly_rainfall = value.scan(/\d*\.\d/).map(&:to_f)
      return monthly_rainfall
    end
  end
end

def mean(town, data)
  return -1.0 unless data.match "#{town}:"

  average_rainfall = weather_data(town, data)
  average_rainfall.sum / 12
end

def variance(town, data)
  return -1.0 if mean(town, data) == -1

  rainfall_values = mean(town, data)
  weather_data(town, data).map { |data_row| (rainfall_values - data_row)**2 }.sum / 12
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
