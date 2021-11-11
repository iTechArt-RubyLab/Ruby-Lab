#!/usr/bin/env ruby

# frozen_string_literal: true

def get_middle(str)
  half_a_len = str.length / 2
  str.length.odd? ? str[half_a_len] : str[half_a_len - 1..half_a_len]
end

def run_cli
  loop do
    puts 'Enter a string'
    str = gets.chomp.to_s
    str.empty? ? (puts 'String can not be blank!') : (puts get_middle(str))
    break if str == 'exit!'
  end
end

run_cli
