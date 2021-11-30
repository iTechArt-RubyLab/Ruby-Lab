#!/usr/bin/env ruby
# frozen_string_literal: true

INPUT_MESSAGE = 'Enter string: '
ERROR_MESSAGE = "String can't be blank"
RESULT_MESSAGE = 'Middle character'
EXIT_MESSAGE = 'exit!'

def run_cli
  loop do
    puts INPUT_MESSAGE
    string = gets.chomp
    break if string == EXIT_MESSAGE

    if string.empty?
      puts ERROR_MESSAGE
    else
      puts "#{RESULT_MESSAGE}: #{get_middle(string)}"
    end
  end
end

def middle(word)
  word.length / 2
end

def get_middle(word)
  word.length.even? ? word[middle(word) - 1..middle(word)] : word[middle(word)]
end

run_cli
