#!/usr/bin/env ruby
# frozen_string_literal: true

def get_middle(str)
  half = str.length / 2
  str.length.even? ? str[(half - 1)..half] : str[half]
end

def run_cli
  loop do
    puts 'Write something'
    str = gets.chomp

    break if str == 'exit!'

    if str.empty?
      puts('Error, line is empty!')
    else
      puts "Middle character: #{get_middle(str)}"
    end
  end
end

run_cli
