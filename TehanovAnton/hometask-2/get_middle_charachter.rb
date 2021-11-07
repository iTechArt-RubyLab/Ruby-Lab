#!/usr/bin/env ruby
# frozen_string_literal: true

ERROR_MESSAGE = "String can't be blank"
ENTER_PROMPT = 'Enter string:'
EXIT = 'exit!'

def get_middle(string)
  half = string.size / 2
  string.length.odd? ? string[half] : string[(half - 1)..half]
end

def error_message
  ERROR_MESSAGE
end

def result(input)
  "Middle character: #{get_middle(input)}"
end

def run_cli
  loop do
    puts ENTER_PROMPT
    input = gets.chomp

    exit if input == EXIT

    puts input.empty? ? error_message : result(input)
  end
end

run_cli
