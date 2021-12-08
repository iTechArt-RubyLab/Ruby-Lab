#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'get_middle_character'

class RunCli
  def run_cli
    loop do
      input_string
      user_input
      break if exit?

      conditional_call
    end
  end

  private

  def input_string
    puts 'Enter your string: '
  end

  def user_input
    @input = gets.chomp
  end

  def exit?
    @input == 'exit!'
  end

  def empty_string
    puts 'String can not be blank!'
  end

  def middle_character
    GetMiddleCharacter.new(@input).result_of_middle
  end

  def conditional_call
    @input.empty? ? empty_string : result
  end

  def result
    puts "Middle character: #{middle_character}"
  end
end

RunCli.new.run_cli
