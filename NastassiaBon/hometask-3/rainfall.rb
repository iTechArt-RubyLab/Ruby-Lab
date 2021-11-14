#!/usr/bin/env ruby
# frozen_string_literal: true

def data_extraction
  file = File.new('data.txt')
  file.read
end

def mean(town, data)
  return -1.0 unless data.include? town

  serch_town(town, data).sum / 12
end

def variance(town, data)
  return -1.0 unless data.include? town

  serch_town(town, data).map { |i| (mean(town, data) - i)**2 }.sum / 12
end

def serch_town(town, data)
  data.split("\n").each do |i|
    if i.include? town
      string = i.scan(/\d*\.\d/).map(&:to_f)
      return string
    end
  end
end

def run_cli
  loop do
    puts 'Enter city name: '
    string = gets.chomp
    break if string == 'exit'

    string.empty? ? puts('City name can not be blank!') : show_result(string)
  end
end

def show_result(input)
  puts "Rainfall mean: #{mean(input, data_extraction)}"
  puts "Rainfall variance: #{variance(input, data_extraction)}"
end

run_cli
