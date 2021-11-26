#!/usr/bin/env ruby

# frozen_string_literal: true

def upload_data
  File.read('data.txt')
end

def string_search(town, string)
  city = string.split("\n").find { |current_string| current_string.include? town }
  return nil if city.nil?

  city.scan(/\d*\.\d/).map(&:to_f)
end

def mean(town, string)
  return -1 if (average = string_search(town, string)).nil?

  average.sum / 12
end

def variance(town, string)
  return -1 if (average = string_search(town, string)).nil?

  mean = average.sum / 12
  average.map { |value| (mean - value)**2 }.sum / 12
end

def run_cli
  loop do
    print 'Enter city: '
    input = gets.chomp
    break if input == 'exit!'

    if input.empty?
      puts 'Empty! Try again'
    else
      result(input)
    end
  end
end

def result(input)
  data = upload_data
  puts "Mean: #{mean(input, data)}\nVariance: #{variance(input, data)}"
end

run_cli
