#!/usr/bin/env ruby
# frozen_string_literal: true

def get_middle(str)
  mid = str.length / 2
  if str.length.odd?
    str[mid]
  else
    str[mid - 1] + str[mid]
  end
end

def run_cli
  loop do
    print 'Enter string: '
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
