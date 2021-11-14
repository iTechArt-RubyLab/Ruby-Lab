#!/usr/bin/env ruby

# frozen_string_literal: true

# get avg and var from rainfall
class Rainfall
  def initialize
    @user_input = user_input
    @city_and_values = {}
  end

  def run_cli
    return if @user_input == 'exit!'

    if @user_input.empty?
      puts 'Mistake!!!'
    else
      puts "Rainfall mean: #{mean}"
      puts "Rainfall variance: #{variance}"
    end

    repeat
  end

  def take_data
    data = File.new('take_data.txt', 'r:UTF-8')
    @data = data.read
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

  def mean
    take_data
    whole_string = @data.split("\n")
    whole_string.each do |string|
      city = /\w+:/.match(string).to_s.delete(':')
      rainfall = string.scan(/([0-9-]+\.[0-9])/).flatten.map(&:to_f)
      @city_and_values[city] = rainfall
    end

    return -1 unless @city_and_values[@user_input]

    @city_and_values[@user_input].sum / 12
  end

  def variance
    avg = mean
    return -1 unless @city_and_values[@user_input]

    var = @city_and_values[@user_input].map { |city_value| (city_value - avg)**2 }
    var.sum / 12
  end
end

total = Rainfall.new

total.run_cli
