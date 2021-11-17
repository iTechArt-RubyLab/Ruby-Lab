#!/usr/bin/env ruby
# frozen_string_literal: true

INPUT_PROMPT = 'Enter city name:'
BLANK_STRING_ERROR = 'City name can not be blank!'
FILE_READ_ERROR = 'Error: data file not found'
EMPTY_ARRAY_ERROR = 'No numeric values found'
INCORRECT_MONTH_NUMBER_WARNING = 'Warning: the number of months is not equal to 12.'
MEAN = 'Rainfall mean:'
VARIANCE = 'Rainfall variance:'
EXIT_STRING = 'exit!'
TOWN_SEARCH_ERROR_NUMBER = -1
MONTH_NUMBER = 12
CURRENT_FILE = 'data.txt'

def file_reader(filename)
  if File.exist?(filename)
    file = File.new(filename, 'r')
    file.read(file.size)
  else
    puts FILE_READ_ERROR
    exit
  end
end

def collector_of_numbers(town, strng)
  collection = nil
  strng.each_line do |line|
    collection = line.scan(/\d+\.*\d*/).map(&:to_f) if line.match(/^#{town}:/)
  end
  collection
end

def mean(town, strng)
  array = collector_of_numbers(town, strng)
  return TOWN_SEARCH_ERROR_NUMBER unless array
  return EMPTY_ARRAY_ERROR if array.empty?

  puts INCORRECT_MONTH_NUMBER_WARNING if array.size != MONTH_NUMBER
  array.sum / array.size
end

def variance(town, strng)
  array = collector_of_numbers(town, strng)
  return TOWN_SEARCH_ERROR_NUMBER unless array
  return EMPTY_ARRAY_ERROR if array.empty?

  mean_val = mean(town, strng)
  array.inject(0) { |memo, n| memo + (n - mean_val)**2 } / array.size
end

def inp_selection(town, strng)
  case town
  when EXIT_STRING
    exit
  when ''
    puts BLANK_STRING_ERROR
  else
    puts "#{MEAN} #{mean(town, strng)}\n#{VARIANCE} #{variance(town, strng)}"
  end
end

def run_cli
  strng = file_reader(CURRENT_FILE)
  loop do
    puts INPUT_PROMPT
    inp_selection(gets.chomp, strng)
  end
end

run_cli
