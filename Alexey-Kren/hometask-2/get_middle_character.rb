#!/usr/bin/env ruby
# frozen_string_literal: true

INPUT_PROMPT = 'Enter string: '
EXIT_STRING = 'exit!'
ERROR_EMPTY = 'String can not be blank'
MESS_RESULT = 'Middle character(str)'

def get_middle(str)
  x = (str.length - 1) / 2
  str[x..-x.succ]
end

def run_cli
  loop do
    puts INPUT_PROMPT
    str = gets.chomp
    break if str == EXIT_STRING
    if str.empty?
      puts ERROR_EMPTY
    else
      puts "#{MESS_RESULT} #{get_middle(str)}"
    end
  end
end

run_cli
