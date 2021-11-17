#!/usr/bin/env ruby
# frozen_string_literal: true

def get_middle(str)
  len = (str.length - 1) / 2.0
  str[len.floor..len.ceil]
end

def run_cli
  loop do
    print 'Enter string: '
    input = gets.chomp
    break if input == 'exit!'

    if input.empty?
      puts 'Empty! Try again'
    else
      puts "Middle character: #{get_middle(input)}"
    end
  end
end
run_cli
