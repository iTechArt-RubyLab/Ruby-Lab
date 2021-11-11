#!/usr/bin/env ruby
# frozen_string_literal: true

ENTER_MESSAGE = 'Enter string: '
ERROR_MESSAGE = "String can't be blank"
RESULT_MESSAGE = 'Middle character: '
EXIT_MESSAGE = 'exit!'

def run_cli
  loop do
    print ENTER_MESSAGE
    string = gets.chomp

    exit if string == EXIT_MESSAGE

    if string.empty?
      puts ERROR_MESSAGE
    else
      puts RESULT_MESSAGE + get_middle(string)
    end
  end
end

def get_middle(string)
  middle_index = (string.size - 1) / 2.0
  string[middle_index.floor..middle_index.round]
end

run_cli
