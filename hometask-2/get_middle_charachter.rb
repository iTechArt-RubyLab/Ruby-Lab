#!/usr/bin/env ruby
# frozen_string_literal: true

def get_middle(string)
  middle = string.length / 2 # your code here

  if string.length.odd?
    string[middle]
  else
    string[middle - 1] + string[middle]
  end
end

def run_cli
  loop do
    puts 'Enter string: '
    string = gets.chomp

    break if string == 'exit'

    if string.empty?
      puts 'String can not be blank!'
    else
      puts "Middle character: #{get_middle(string)}"
    end
  end
end

run_cli
