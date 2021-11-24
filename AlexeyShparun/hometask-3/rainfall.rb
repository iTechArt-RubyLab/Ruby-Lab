#!/usr/bin/env ruby
# frozen_string_literal: true

def upload_data
  data = File.new('data.txt')
  content = data.read
  data.close
  content
end

def string_search(town, _string)
  val = upload_data.split("\n").find { |town_val| town_val.include? town }
  x = ''
  val.nil? ? x : val
end

def rainfall_average(town, string)
  string_search(town, string).scan(/\d*\.\d/).map(&:to_f)
end

def city_validate(town, string)
  string_search(town, string).include?(town)
end

def mean(town, string)
  return -1 unless city_validate(town, string)

  rainfall_average(town, string).sum / 12
end

def variance(town, string)
  return -1 unless city_validate(town, string)

  rainfall_average(town, string).map { |x| (mean(town, string) - x)**2 }.sum / 12
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
  puts "Mean: #{mean(input, upload_data)}"
  puts "Variance: #{variance(input, upload_data)}"
end

run_cli
