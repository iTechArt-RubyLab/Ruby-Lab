#!/usr/bin/env ruby
# frozen_string_literal: true

# find middle character
class MiddleCharacterFinder
  EXIT = 'exit!'
  def run_cli
    loop do
      print_input_message
      @choice = gets.chomp
      break if exit?

      print_result
    end
  end

  private

  attr_accessor :choice

  def exit?
    choice.eql?(EXIT)
  end

  def print_input_message
    puts 'Enter string: '
  end

  def print_error_message
    puts 'String can not be blank!'
  end

  def middle
    choice[(choice.length - 1) / 2..choice.length / 2]
  end

  def print_middle
    puts("Middle character: #{middle}")
  end

  def print_result
    choice.empty? ? print_error_message : print_middle
  end
end

MiddleCharacterFinder.new.run_cli
