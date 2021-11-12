#!/usr/bin/env ruby
# frozen_string_literal: true

EXIT_STATE = 'exit!'
ERROR_MESSAGE = 'String can not be blank'
def get_middle(inputed_string)
  last_element = inputed_string.size - 1
  middle_element = inputed_string.size / 2
  inputed_string[last_element / 2..middle_element]
end

def run_cli
  loop do
    print 'Enter string: '
    inputed_string = gets.strip
    exit if inputed_string == EXIT_STATE
    if inputed_string.empty?
      puts ERROR_MESSAGE
    else
      puts "Middle character: #{get_middle(inputed_string)}"
    end
  end
end

run_cli
