#!/usr/bin/env ruby
# frozen_string_literal: true

def get_middle(str)
  middle_symbol_point = str.length / 2 - 1
  middle_symbol = str[middle_symbol_point]
  middle_next_symbol = str[middle_symbol_point + 1]
  str.length == 1 ? str : (str.length.even? ? middle_symbol + middle_next_symbol : middle_next_symbol)
end

def run_cli
  loop do
    print "Enter string: "
    str = gets.chomp
    if str == "exit!"
      exit!
    elsif str.empty?
      puts "String can not be blank!"
    else
      puts "Middle character(s): #{get_middle(str)}"
    end
  end
end

run_cli
