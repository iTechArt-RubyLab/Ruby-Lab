#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'get_middle_character'
require_relative 'validator'

# Getting result of middle character
class RunCli
  def run_cli(str = nil)
    return if exit?(str)

    puts 'Enter your string: '
    str = user_input

    print_result(str)

    run_cli(str)
  end

  private

  def user_input
    gets.chomp
  end

  def exit?(str)
    str == 'exit!'
  end

  def middle_character(str)
    GetMiddleCharacter.new(str).result_of_middle
  end

  def print_result(str)
    return if exit?(str)

    validator = Validator.new(str)
    validator.validate

    puts validator.valid? ? "Middle character: #{middle_character(str)}" : validator.error_messages
  end
end

RunCli.new.run_cli
