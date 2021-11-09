#!/usr/bin/env ruby

# frozen_string_literal: true

def get_middle(str)
  str.length.even? ? str[str.length / 2 - 1] + str[str.length / 2] : str[str.length / 2]
end

def run_cli
  loop do
    puts 'Enter string: '
    string = gets.chomp
    break if string.downcase == 'exit!'

    if string == ''
      puts 'String cannot be blank!'
    else
      get_middle(string)
      puts "Middle character is: #{get_middle(string)}"
    end
  end
end

run_cli
