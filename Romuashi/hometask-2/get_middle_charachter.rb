#!/usr/bin/env ruby
# frozen_string_literal: true

def get_middle(str)
  middle_position = str.length / 2
  str.length.odd? ? str[middle_position] : str[(middle_position - 1)..middle_position]
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
