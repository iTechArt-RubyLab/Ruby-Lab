#!/usr/bin/env ruby
# frozen_string_literal: true

EXIT_COMMAND = 'exit!'

def calculate_middle_characters(str)
  mid = str.length / 2
  if str.length.odd?
    str[mid]
  else
    str[mid - 1] + str[mid]
  end
end

def run_cli
  loop do
    print 'Enter string: '
    str = gets.chomp
    break if str == EXIT_COMMAND

    if str.empty?
      puts 'String can not be blank!'
    else
      puts "Middle character: #{calculate_middle_characters(str)}"
    end
  end
end
run_cli
