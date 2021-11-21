#!/usr/bin/env ruby
# frozen_string_literal: true

def uploading_data
  data = File.new('data.txt')
  data.read
end

def mean(town, string)
  return -1 unless string.include?(town)

  city_search(town, string).sum / 12
end

def variance(town, string)
  return -1 unless string.include?(town)

  city_search(town, string).map { |x| (mean(town, string) - x)**2 }.sum / 12
end

def city_search(town, string)
  string.split("\n").each do |city|
    return city.scan(/\d*\.\d/).map(&:to_f) if city.include?(town)
  end
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
  puts "Mean: #{mean(input, uploading_data)}"
  puts "Variance: #{variance(input, uploading_data)}"
end

run_cli
