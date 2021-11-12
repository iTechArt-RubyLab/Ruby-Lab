#!/usr/bin/env ruby
# frozen_string_literal: true

def get_middle(str)
  x = str.length / 2
  str.slice(x - 1, x) if str.length.even?
end

def run_cli
  loop do
    p 'Enter your string: '
    text = gets.chomp
    break if text == 'exit!'

    if text.empty?
      p "String can't be blank!"
    else
      p "Get middle: #{get_middle(text)}"
    end
  end
end

run_cli
