#!/usr/bin/env ruby

# frozen_string_literal: true

def get_middle(str)
  if (str.length % 2).zero? && str.length != 1
    mid = str[str.length / 2 - 1]
    mid += str[str.length / 2]
    mid
  elsif str.length # even?
    str[str.length / 2]
  elsif str.length == 1
    str
  end
end

def run_cli
  loop do
    puts 'Enter a string'
    str = gets.chomp.to_s
    if str.empty? == true
      puts 'String can not be blank!'
    elsif str == 'exit!'
      break
    else
      puts get_middle(str)
    end
  end
end

run_cli
