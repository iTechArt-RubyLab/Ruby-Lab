#!/usr/bin/env ruby
# frozen_string_literal: true
inpt = 'Enter string: '
ext = 'exit!'
empt = 'String can not be blank'


def get_middle(str)
  x = (str.length - 1) / 2
  str[x.. - x.succ]
end

def run_cli
  loop do
    p inpt
    str = gets.chomp

    break if str == ext

    if str.empty?
      p empt
    else
      p  "Middle character: #{get_middle(str)}"
    end
  end
end

run_cli
