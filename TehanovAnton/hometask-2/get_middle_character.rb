#!/usr/bin/env ruby
# frozen_string_literal: true

def middle_character(string)
  half = string.size / 2
  string.length.odd? ? string[half] : string[(half - 1)..half]
end

def error_message
  "String can't be blank"
end

def result(input)
  "Middle character: #{middle_character(input)}"
end

def run_cli
  loop do
    puts 'Enter string:'
    input = gets.chomp

    exit if input == 'exit!'

    puts input.empty? ? error_message : result(input)
  end
end

run_cli
