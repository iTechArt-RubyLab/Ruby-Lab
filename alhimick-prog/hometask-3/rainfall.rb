#!/usr/bin/env ruby
# frozen_string_literal: true

INPUT_PROMPT = 'Enter city name:'
ERROR_BLANK_STRING = 'City name can not be blank!'
ERROR_FILE_READ_FAIL = 'Error: data file not found'
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
    file.sysread(file.size)
    # I know i could use a method .readlines to get an array from file,
    # but in the condition of assignment
    # data is passed to methods 'mean' and 'variance' as a string.
  else
    puts ERROR_FILE_READ_FAIL
    exit
  end
end

def town_pos(town, strng)
  pos = /\s#{town}:/ =~ strng
  pos ? pos + 1 : /^#{town}:/ =~ strng
end

def ending_search_point(start_search_pos, strng)
  point = /\n/ =~ strng[start_search_pos..strng.size]
  point ? (point + start_search_pos) : (strng.size - 1)
end

def form_array(town, strng)
  return nil unless town_pos(town, strng)

  start_search_pos = town_pos(town, strng) + town.size + 1
  ending_search_pos = ending_search_point(start_search_pos, strng)
  strng[start_search_pos..ending_search_pos].scan(/\d+\.*\d*/).map(&:to_f)
end

def mean(town, strng)
  array = form_array(town, strng)
  return TOWN_SEARCH_ERROR_NUMBER unless array

  puts MESSAGE_INCORRECT_MONTH_NUMBER if array.size != MONTH_NUMBER
  array.sum / array.size
end

def variance(town, strng)
  array = form_array(town, strng)
  return TOWN_SEARCH_ERROR_NUMBER unless array

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
