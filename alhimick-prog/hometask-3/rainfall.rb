#!/usr/bin/env ruby
# frozen_string_literal: true

INPUT_PROMPT = 'Enter city name:'
ERROR_BLANK_STRING = 'City name can not be blank!'
ERROR_FILE_READ_FAIL = 'Error: data file not found'
ERROR_MOUNT_NUMBER = 'Error: something went wrong when counting months.'
MEAN = 'Rainfall mean:'
VARIANCE = 'Rainfall variance:'
EXIT_STRING = 'exit!'
TOWN_ERROR = -1
MOUNTH_NUMBER = 12
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
  pos = /(^|\s)#{town}:/ =~ strng
  case pos
  when /^#{town}:/ =~ strng
    pos
  when /\s#{town}:/ =~ strng
    pos + 1
  else
    false
  end
end

def form_substring(pos, strng)
  substr = ''
  loop do
    substr += strng[pos]
    pos += 1
    break if strng[pos] == "\n" || pos == strng.size
  end
  substr
end

def form_array(town, strng)
  if town_pos(town, strng)
    start_search_pos = town_pos(town, strng) + town.size + 1
    substr = form_substring(start_search_pos, strng)
    substr.scan(/\d+\.*\d*/).map(&:to_f)
  else
    false
  end
end

def mean(town, strng)
  array = form_array(town, strng)
  return TOWN_ERROR unless array

  puts ERROR_MOUNT_NUMBER if array.size != MOUNTH_NUMBER
  array.sum / array.size
end

def variance(town, strng)
  array = form_array(town, strng)
  return TOWN_ERROR unless array

  mean_val = mean(town, strng)
  i = 0
  sum = 0
  while i < array.size
    sum += (array[i] - mean_val)**2
    i += 1
  end
  sum / array.size
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
