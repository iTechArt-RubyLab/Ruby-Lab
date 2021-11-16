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
  loop do
    puts INPUT_PROMPT
    string = gets.chomp
    exit if string == EXIT_STRING
    if string.empty?
      puts ERROR_BLANK_STRING
    else
      puts "#{MESSAGE_RESULT} #{get_middle(string)}"
    end
  end
end

run_cli
