# !/usr/bin/env ruby
# frozen_string_literal: true

STOP_WORD = 'exit!'
ERROR_MESSAGE = 'String can not be blank!'

def get_middle(str)
  middle_point = (str.length / 2).ceil - 1
  str.length.even? ? str[middle_point..middle_point + 1] : str[middle_point + 1]
end

def run_cli
  loop do
    print 'Enter string: '
    str = gets.chomp
    if str == STOP_WORD
      exit!
    elsif str.empty?
      puts ERROR_MESSAGE
    else puts "Middle character(s): #{get_middle(str)}"     end
  end
end

run_cli
