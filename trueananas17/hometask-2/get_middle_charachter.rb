#!/usr/bin/env ruby

def get_middle(str)
  if s.length % 2 == 0
    mid = str[str.length/2-1]
    mid += str[str.length/2]
    return mid
  elsif s.length % 2 != 0
    mid = str[str.length / 2]
    return mid
  end
end

def run_cli
  while true
    puts "Enter a string"
    str = gets.chomp.to_s
    if str.empty? == true
      puts "String can not be blank!"
    elsif str == "exit!"
      break
    else puts get_middle(str)
    end
  end
end

run_cli
