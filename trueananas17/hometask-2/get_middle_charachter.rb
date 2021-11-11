#!/usr/bin/env ruby

def get_middle(s)
  if s.length % 2 == 0
    mid = s[s.length/2-1]
    mid += s[s.length/2]
    return mid
  elsif s.length % 2 != 0
    mid = s[s.length/2]
    return mid
  end
end


def run_cli()
  while true
    puts "Enter a string"
    s = gets.chomp.to_s
    if s.empty? == true
      puts "String can not be blank!"
    elsif s == "exit!"
      break
    else puts get_middle(s)
    end
  end
end

run_cli()
