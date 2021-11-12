#!/usr/bin/env ruby
# frozen_string_literal: true

INPUT_PROMPT = 'Please, enter string:'
ERROR_BLANK_STRING = 'String can not be blank!'
MESSAGE_RESULT = 'Middle character(s):'
EXIT_STRING = 'exit!'

def get_middle(string)
  mid = string.length / 2
  if string.length.odd?
    string[mid]
  else
    string[mid - 1] + string[mid]
  end
end

def run_cli
  string = ''
  until string == EXIT_STRING
    stop = false
    puts INPUT_PROMPT
    string = gets.chomp
    stop = true if string == EXIT_STRING
    puts "#{MESSAGE_RESULT} #{get_middle(string)}" if !string.empty? && !stop
    puts ERROR_BLANK_STRING if string.empty?
  end
end

run_cli
