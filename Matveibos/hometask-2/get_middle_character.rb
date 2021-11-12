#!/usr/bin/env ruby

# frozen_string_literal: true

def run_cli
  loop do
    puts 'Enter string'
    string = gets.chomp
    break if string == 'exit!'

    if string.empty?
      puts 'String can not be blank!'
    else
      puts "Middle character: #{get_middle(string)}"

    end
  end
end

def get_middle(str)
  if str.length.even?
    puts str[str.length / 2 - 1] + str[str.length / 2]
  else
    puts str[str.length / 2]
  end
end

run_cli
