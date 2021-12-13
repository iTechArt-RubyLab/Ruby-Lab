#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'lib/rainfall'
require_relative 'lib/validator'

# Getting result of rainfalls
class RunCli
  def run_cli
    puts 'Enter city name: '
    town = user_input

    return if exit?(town)

    print_result(town)

    run_cli
  end

  private

  def user_input
    gets.chomp
  end

  def exit?(town)
    town == 'exit!'
  end

  def result_of_values(town)
    print "Rainfall mean: #{rainfall.mean_result(town)}\n"
    print "Rainfall variance: #{rainfall.variance_result(town)}"
  end

  def print_result(town)
    validator = Validator.new(town)
    validator.validate

    puts validator.valid? ? result_of_values(town) : validator.error_messages
  end

  def rainfall
    @rainfall ||= Rainfall.new(file_path('data.txt'))
  end

  def file_path(file_name)
    "#{File.dirname(__FILE__)}/#{file_name}"
  end
end

RunCli.new.run_cli
