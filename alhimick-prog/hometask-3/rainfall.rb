#!/usr/bin/env ruby
# frozen_string_literal: true

INPUT_PROMPT = 'Enter city name:'
ERROR_BLANK_STRING = 'City name can not be blank!'
ERROR_FILE_READ_FAIL = 'Error: data file not found'
ERROR_EMPTY_ARRAY = 'No numeric values found'
MESSAGE_INCORRECT_MONTH_NUMBER = 'Warning: the number of months is not equal to 12.'
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
    puts ERROR_FILE_READ_FAIL
    exit
  end
end

def form_array(town, strng)
  array = nil
  strng.each_line do |line|
    array = line.scan(/\d+\.*\d*/).map(&:to_f) if line.match(/^#{town}:/)
  end
  array
end

def mean(town, strng)
  array = form_array(town, strng)
  return TOWN_SEARCH_ERROR_NUMBER unless array
  return ERROR_EMPTY_ARRAY if array.empty?

  puts MESSAGE_INCORRECT_MONTH_NUMBER if array.size != MONTH_NUMBER
  array.sum / array.size
end

def variance(town, strng)
  array = form_array(town, strng)
  return TOWN_SEARCH_ERROR_NUMBER unless array
  return ERROR_EMPTY_ARRAY if array.empty?

  mean_val = mean(town, strng)
  array.inject(0) { |memo, n| memo + (n - mean_val)**2 } / array.size
end

def inp_selection(town, strng)
  case town
  when EXIT_STRING
    exit
  when ''
    puts ERROR_BLANK_STRING
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
