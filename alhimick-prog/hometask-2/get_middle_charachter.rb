#!/usr/bin/env ruby
# frozen_string_literal: true

def get_middle(string)
  mid = string.length / 2
  if string.length.odd?
    string[mid]
  else
    string[mid - 1] + string[mid]
  end
end

def validation(string)
  if string.empty?
    puts 'String can not be blank!'
    false
  else
    true
  end
end

def run_cli
  string = ''
  until string == 'exit!'
    stop = false
    puts 'Please, enter string:'
    string = gets.chomp.to_s
    stop = true if string == 'exit!'
    puts "Middle character(s): #{get_middle(string)}" if validation(string) && !stop
  end
end

run_cli
