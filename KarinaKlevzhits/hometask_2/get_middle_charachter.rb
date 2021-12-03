#!/usr/bin/env ruby
# frozen_string_literal: true

def run_cli
  loop do
    input_message
    word = gets.chomp
    break if exit?(word)

    if word.empty?
      error_message
    else
      result_message(word)
    end
  end
end

def input_message
  puts 'Enter string: '
end

def error_message
  puts "String can't be blank"
end

def result_message(word)
  puts "Middle character: #{get_middle(word)}"
end

def exit?(word)
  word.eql?('exit!')
end

def middle(word)
  word.length / 2
end

def get_middle(word)
  word.length.even? ? word[middle(word) - 1..middle(word)] : word[middle(word)]
end

run_cli
