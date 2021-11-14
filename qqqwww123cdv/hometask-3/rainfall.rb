#!/usr/bin/env ruby
# frozen_string_literal: true

def data_get
  file = File.new('data.txt')
  file.read
end

def weather_data(town, data)
  data.split("\n").each do |i|
    if i.include? town
      str = i.scan(/\d*\.\d/).map(&:to_f)
      return str
    end
  end
end

def mean(town, data)
  return -1 unless data.match "#{town}:"

  weather_data(town, data).sum / 12
end

def variance(town, data)
  return -1 unless data.match "#{town}:"

  weather_data(town, data).map { |i| (mean(town, data) - i)**2 }.sum / 12
end

def show_result(town)
  puts "Rainfall mean: #{mean(town, data_get)}"
  puts "Rainfall variance: #{variance(town, data_get)}"
end

def run_cli
  loop do
    puts 'Enter city name: '
    str = gets.chomp
    break if str == 'exit!'

    if str.empty?
      puts 'Error, line is empty!'
    else
      show_result(str)
    end
  end
end
run_cli
