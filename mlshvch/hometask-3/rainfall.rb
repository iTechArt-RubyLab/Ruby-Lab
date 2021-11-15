#!/usr/bin/env ruby

# frozen_string_literal: true

EXIT_COMMAND = 'exit!'
ERROR_MESSAGE = 'City name can not be blank!'

def extract_data(strng)
  hash = {}
  strng.split("\n").each do |data|
    array = []
    city, values = data.split(':')
    results = values.split(',')
    results.each { |value| array.push(value.split(' ')[1]) }
    hash[city] = array
  end
  hash
end

def mean(town, strng)
  mean = -1.0
  sum = nil.to_f
  data = extract_data(strng)
  unless data[town].nil?
    data[town].each { |value| sum += value.to_f }
    mean = sum / data[town].length
  end
  mean
end

def variance(town, strng)
  variance = -1.0
  sum = nil.to_f
  data = extract_data(strng)
  unless data[town].nil?
    mean_value = mean(town, strng)
    data[town].each { |value| sum += (value.to_f - mean_value)**2 }
    variance = sum / data[town].length
  end
  variance
end

def run_cli
  loop do
    puts 'Enter city name:'
    input = gets.chomp
    break if input == EXIT_COMMAND

    success_message = "Rainfall mean: #{mean(input, '')}\nRainfall variance: #{variance(input, '')}"

    puts input.empty? ? ERROR_MESSAGE : success_message
  end
end

run_cli
