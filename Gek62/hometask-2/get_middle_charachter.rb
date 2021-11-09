#!/usr/bin/env ruby

# frozen_string_literal: true

def get_middle(str)
  str.length.even? ? str[str.length / 2 - 1] + str[str.length / 2] : str[str.length / 2]
end

def run_cli
  loop do
    puts 'Enter string: '
    str = gets.chomp
    break if str.downcase == 'exit!'

    str.empty? ? puts('String cannot be blank!') : puts("Middle character is: #{get_middle(str)}")
  end
end

run_cli
