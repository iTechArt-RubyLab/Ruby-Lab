#!/usr/bin/env ruby

# frozen_string_literal: true

def get_middle(str)
  if s.length.even?
    puts (str[str.length / 2 - 1] + str[str.length / 2]).chomp
  else
    puts (str[str.length / 2]).chomp
  end
end

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
run_cli
