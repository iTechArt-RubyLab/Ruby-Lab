#!/usr/bin/env ruby
# frozen_string_literal: true

def get_middle(str)
  x = str.length / 2
  str.length.odd? ? str[x] : str[x - 1] + str[x]
end

def run_cli
  loop do
    p 'Enter string: '
    str = gets.chomp

    break if str == 'exit!'

    if str.empty?
      p 'String can not be blank!'
    else
      p "Middle character: #{get_middle(str)}"
    end
  end
end

run_cli
