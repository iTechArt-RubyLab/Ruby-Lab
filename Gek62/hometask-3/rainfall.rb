#!/usr/bin/env ruby

# frozen_string_literal: true

def data
  @data = File.read('data', encoding: 'UTF-8')
end

def blank_error
  puts 'City name can not be blank!'
end

def mean(town, data)
  return -1 if (numbers = extract_data(town, data)).nil?

  numbers.sum / 12
end

def variance(town, data)
  return -1 if (numbers = extract_data(town, data)).nil?

  mean = numbers.sum / 12
  @variance = numbers.map { |x| (x - mean)**2 }.sum / 12
end

def extract_data(town, data)
  data_hash = data.split("\n").map { |str| str.split(':') }.to_h
  return nil if data_hash[town].nil?

  @numbers = data_hash[town].scan(/\d+.\d+/).map(&:to_f)
end

def rainfall_results(town)
  puts "Rainfall mean: #{mean(town, data)}"
  puts "Rainfall variance: #{variance(town, data)}"
end

def run_cli
  loop do
    puts 'Enter city name:'
    input = gets.chomp
    break if input.downcase == 'exit!'

    input.empty? ? blank_error : rainfall_results(input)
  end
end

run_cli
