#!/usr/bin/env ruby

# frozen_string_literal: true

# begin resault # = gets.chomp

# get middle from world
class Middle
  puts 'Enter a string:'
  def initialize
    @user_input = user_input
    @receive_length
  end

  def user_input
    gets.chomp
  end

  def repeat
    puts 'Enter a string:'
    @user_input = gets.chomp

    run_cli
  end

  def run_cli
    return if @user_input == 'exit!'

    if @user_input.empty?
      puts 'Mistake!!!'
    else
      its_middle

    end

    repeat
  end

  def its_middle
    @receive_length = @user_input.length
    if @receive_length.odd?
      same_string(@user_input[@receive_length / 2])
    else
      same_string(@user_input[@receive_length / 2 - 1] + @user_input[@receive_length / 2])
    end
  end
  
  def same_string(middle_character)
    puts "Middle character: #{middle_character}"
  end
    
end
  
middle = Middle.new

middle.run_cli
