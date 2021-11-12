#!/usr/bin/env ruby
# frozen_string_literal: true

def get_middle(str)
  if str.length.even?
    str[str.length / 2 - 1] + str[str.length / 2]

  else
    str[str.length / 2]

  end
end

def run_cli
  loop do
    p 'Enter your string: '
    text = gets.chomp
    abort if text == 'exit!'
    if text.empty?
      p "String can't be blank!"
    else
      p "Get middle: #{get_middle(text)}"
    end
  end
end

run_cli
