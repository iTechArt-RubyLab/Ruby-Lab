#!/usr/bin/env ruby

# frozen_string_literal: true

# begin resault # = gets.chomp

# get middle from world
class Middle
  def initialize
    @user_input = user_input
    @receive_length = @user_input.length
  end

  def run_cli
    return if @user_input == 'exit!'

    if @user_input.empty?
      puts 'Mistake!!!'
    else
      catch_middle
    end

    repeat
  end

  private

  def user_input
    puts 'Enter a string:'
    gets.chomp
  end

  def repeat
    @user_input = user_input

    run_cli
  end

  def catch_middle
    if @receive_length.odd?
      puts_middle_character(@user_input[@receive_length / 2])
    else
      puts_middle_character(@user_input[@receive_length / 2 - 1] + @user_input[@receive_length / 2])
    end
  end

  def puts_middle_character(middle_character)
    puts "Middle character: #{middle_character}"
  end
end

middle = Middle.new

middle.run_cli
