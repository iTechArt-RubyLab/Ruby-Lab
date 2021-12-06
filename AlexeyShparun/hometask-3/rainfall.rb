#!/usr/bin/env ruby
# frozen_string_literal: true

# this class is used for calculate mean and variance values
class Rainfall
  def initialize(town, data)
    search = data.split("\n").find { |current_string| current_string.include? town }.to_s
    @average = search.scan(/\d*\.\d/).map(&:to_f)
    @mean = @average.sum / 12
  end

  def mean
    return -1 if @average.empty?

    @mean
  end

  def variance
    return -1 if @average.empty?

    @average.map { |value| (@mean - value)**2 }.sum / 12
  end
end

# this class is used to input and output values
class Cli
  def data
    File.read('data.txt')
  end

  def run_cli
    loop do
      print 'Enter city: '
      input = gets.chomp
      break if input == 'exit!'

      if input.empty?
        puts 'Empty! Try again'
      else
        result(input)
      end
    end
  end

  def result(input)
    statistics = Rainfall.new(input, data)
    puts "Mean: #{statistics.mean}\nVariance: #{statistics.variance}"
  end
end

Cli.new.run_cli
