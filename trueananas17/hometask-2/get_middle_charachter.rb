#!/usr/bin/env ruby

# frozen_string_literal: true

def get_middle(str)
  half_len = str.length / 2
  str.length.odd? ? str[half_len] : str[half_len - 1..half_len]
end

def run_cli
  loop do
    puts 'Enter a string'
    str = gets.chomp.to_s
    break if str == 'exit!'

    str.empty? ? (puts 'String can not be blank!') : (puts get_middle(str))
  end
end

run_cli
