#!/usr/bin/env ruby
# frozen_string_literal: true

def get_middle(s)
    middle = s.length / 2 #your code here
    
    if s.length.odd?
      s[middle]
    else
      s[middle - 1] + s[middle]
    end
    
  end

  def run_cli
    loop do 
    puts "Enter string: "
    string = gets.chomp
    
    break if string == 'exit'

    if string.empty?
        puts 'String can not be blank!'
    else 
        puts "Middle character: #{get_midddle(string)}"
    end 
end
end

run_cli 