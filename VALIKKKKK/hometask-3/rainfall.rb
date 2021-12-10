#!/usr/bin/env ruby
# frozen_string_literal: true

# Class Rainfall calculates mean and variance
class Rainfall
  def initialize(city, history)
    @city = city
    @history = history
  end

  def call
    { mean: mean, variance: variance }
  end

  private

  attr_accessor :city, :history

  def parsed_history
    @parsed_history ||= history.split("\n").find { |history_item| history_item.include? city }.to_s
  end

  def precipitation
    @precipitation ||= parsed_history.scan(/\d*\.\d/).map(&:to_f)
  end

  def average
    @average ||= precipitation.sum / precipitation.size
  end

  def mean
    @mean ||= precipitation.empty? ? -1 : average
  end

  def variance
    @variance ||= if precipitation.empty?
                    -1
                  else
                    precipitation.map do |precipitation_item|
                      (average - precipitation_item)**2
                    end.sum / precipitation.size
                  end
  end
end

# Class Cli
class Cli
  def strings
    File.read('data.txt')
  end

  def run_cli
    loop do
      print 'Enter city: '
      input = gets.chomp
      break if input == 'exit!'

      results(input)
    end
  end

  def results(input)
    if input.empty?
      puts 'String can not be blank! Try again'
    else
      print_result_string(**precipitation(input))
    end
  end

  def print_result_string(mean:, variance:)
    puts "Mean: #{mean}\nVariance: #{variance}"
  end

  def precipitation(input)
    Rainfall.new(input, strings).call
  end
end

Cli.new.run_cli
