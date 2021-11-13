#!/usr/bin/env ruby
# frozen_string_literal: true
inpt = 'Enter string: '
exit = 'exit!'
empty = 'String can not be blank'

def get_middle(str)
  x = (str.length - 1) / 2
  str[x..-x.succ]
end

def run_cli
  loop do
    p inpt
    str = gets.chomp

    break if str == exit

    if str.empty?
      p empty
    else
      p  "Middle character: #{get_middle(str)}"
    end
  end
end

run_cli
