#!/usr/bin/env ruby

# frozen_string_literal: true

def get_middle(s)
  if s.length.even?
    puts (s[s.length / 2 - 1] + s[s.length / 2]).chomp
  else
    puts (s[s.length / 2]).chomp
  end
end

def run_cli
  loop do
    puts 'Enter string'
    st = gets.chomp
    break if st == 'exit!'

    if st.empty?
      puts 'String can not be blank!'
    else
      puts "Middle character: #{get_middle(st)}"

    end
  end
end
run_cli
