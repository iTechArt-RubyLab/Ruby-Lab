#!/usr/bin/env ruby
# frozen_string_literal: true

def get_middle(str)
  len = (str.length - 1) / 2.0
  str[len.floor..len.ceil]
end

def run_cli
  loop do
    print "Enter string: \n"
    input = gets.chomp
    break if input == 'exit!'

    if input.empty?
      print "String can not be blank!\n"
    else
      print "Middle character: #{get_middle(input)}\n"
    end
  end
end

run_cli
