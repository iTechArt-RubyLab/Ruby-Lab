#!/usr/bin/env ruby

# begin resault # = gets.chomp

# frozen_string_literal: true

# get middle from world
class Middle
  puts 'Enter a string:'
  def initialize(user_input = gets.chomp)
    @user_input = user_input
  end

  def repeat
    puts 'Enter a string:'
    @user_input = gets.chomp

    run_cli
  end

  def run_cli
    return if @user_input == 'exit!'

    if @user_input == ''
      puts 'Mistake!!!'
    else
      its_middle

    end

    repeat
  end

  def its_middle
    a = @user_input.length
    if a.odd?

      puts "Middle character: #{@user_input[a / 2]}"
    else
      puts "Middle character: #{@user_input[a / 2 - 1] + @user_input[a / 2]}"
    end
  end
end
middle = Middle.new

middle.run_cli
