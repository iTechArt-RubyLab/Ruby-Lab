#!/usr/bin/env ruby

# frozen_string_literal: true

ENTER_STRING = 'enter string'
ERROR = 'String can not be blank!'
EXIT = 'exit!'
RESULT = 'Middle character:'
def get_middle(str)
  slen = (str.length - 1) / 2.0
  str[slen.floor..slen.ceil]
end

def run_cli
  loop do
    puts ENTER_STRING
    st = gets.chomp
    break if st == EXIT

    st.empty? ? (puts ERROR) : (puts "#{RESULT}  #{get_middle(st)}")
  end
end
run_cli
