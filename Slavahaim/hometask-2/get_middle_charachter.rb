#!/usr/bin/env ruby
# frozen_string_literal: true

def get_middle(str)
  str[(str.size - 1) / 2..str.size / 2]
end

def run_cli
  loop do
    print 'Enter string: '
    str = gets.strip
    exit if str == 'exit!'
    if str.empty?
      puts 'String can not be blank!'
    else
      puts "Middle character: #{get_middle(str)}"
    end
  end
end

run_cli
