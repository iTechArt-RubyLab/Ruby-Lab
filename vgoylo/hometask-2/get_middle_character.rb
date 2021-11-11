#!/usr/bin/env ruby
# frozen_string_literal: true

def get_middle(str)
  middle = str.length / 2

  if str.length.even?
    str[middle - 1] + str[middle]
  else
    str[middle]
  end
end

def run_cli
  loop do
    print 'Enter string: '
    str = gets.chomp
    break if str == 'exit!'

    if str.empty?
      puts 'You enter invalid string! Try again'
    else
      puts "Middle character: #{get_middle(str)}"
    end
  end
end

run_cli
