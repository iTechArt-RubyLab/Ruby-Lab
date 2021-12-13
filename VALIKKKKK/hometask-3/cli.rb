#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'lib/rainfall'

# Class Cli
class Cli
  def run_cli
    loop do
      print 'Enter city: '
      @input = gets.chomp
      break if input == 'exit!'

      results
    end
  end

  private

  attr_accessor :input

  def history
    @history ||= File.read('data.txt')
  end

  def results
    if input.strip.empty?
      puts 'String can not be blank! Try again'
    else
      print_result_string(**precipitation(input))
    end
  end

  def print_result_string(mean:, variance:)
    puts "Mean: #{mean}\nVariance: #{variance}"
  end

  def precipitation(input)
    Rainfall.new(input, history).call
  end
end

Cli.new.run_cli
