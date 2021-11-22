#!/usr/bin/env ruby
# frozen_string_literal: true

def get_middle(string)
  middle = string.length / 2 # your code here

  string.length.odd? ? string[middle] : string[(middle - 1)..middle]
end

def run_cli
  loop do
    puts 'Enter string: '
    string = gets.chomp
    break if string == 'exit'

    string.empty? ? puts('String can not be blank!') : puts("Middle character: #{get_middle(string)}")
  end
end

run_cli
