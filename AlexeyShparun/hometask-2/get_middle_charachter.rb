#!/usr/bin/env ruby

# frozen_string_literal: true

def get_middle(str)
  if str.length.even?
    str[str.length / 2 - 1] + str[str.length / 2]
  else
    str[str.length / 2]
  end
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
