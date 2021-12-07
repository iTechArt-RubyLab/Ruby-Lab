#!/usr/bin/env ruby
# frozen_string_literal: true

require './get_middle_character'

# Run program
class RunCli
  def run_cli
    loop do
      enter_string
      user_input
      break if exit?

      call
    end
  end

  private

  def enter_string
    puts 'Enter your string: '
  end

  def user_input
    @str = gets.chomp
  end

  def exit?
    @str == 'exit!'
  end

  def empty_string
    puts 'String can not be blank!'
  end

  def middle_charcter
    GetMiddleCharacter.new(@str).result_of_middle
  end

  def call
    @str.empty? ? empty_string : result
  end

  def result
    puts "Middle character: #{middle_charcter}"
  end
end

RunCli.new.run_cli
