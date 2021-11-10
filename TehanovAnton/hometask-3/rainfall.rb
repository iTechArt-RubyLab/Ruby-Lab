#!/usr/bin/env ruby
# frozen_string_literal: true

def run_cli
  RainfallCli.new.run_cli
end

# RainfallCli designed to initialise data for run_cli method
class RainfallCli
  def run_cli
    loop do
      puts 'Enter city name:'
      input = gets.chomp

      break if input == 'exit!'

      input.empty? ? show_error_message : show_result(input)
    end
  end

  private

  def show_error_message
    puts "City name can't be blank"
  end

  def show_result(input)
    statistics = RainfallStatistics.new(input, data)
    puts "Rainfall mean: #{statistics.mean}"
    puts "Rainfall variance: #{statistics.variance}"
  end

  def data
    @data ||= File.open('rainfall_data').read
  end
end

# RainfallStatistics designed to calculate mean and variance values
class RainfallStatistics
  attr_reader :town, :data

  def initialize(town, data)
    @town = town
    @data = data
  end

  def mean
    return -1 if missing_data?

    average(parse_rainfall_values)
  end

  def variance
    return -1 if missing_data?

    calculate_variance(calculate_rainfall_diviations)
  end

  private

  def find_town_rainfall_data
    return if town.empty?

    @find_town_rainfall_data ||= data.each_line.find do |town_rainfall_data|
      town_rainfall_data.start_with?("#{town}:")
    end
  end

  def missing_data?
    !find_town_rainfall_data
  end

  def parse_rainfall_values
    @parse_rainfall_values ||= find_town_rainfall_data.scan(/\d+.\d+/).map(&:to_f)
  end

  def average(values)
    values.sum / values.size
  end

  def calculate_rainfall_diviations
    parse_rainfall_values.map { |value| value - mean }
  end

  def calculate_variance(rainfall_diviations)
    sum_squared_diviations = rainfall_diviations.sum { |el| el**2 }
    sum_squared_diviations / rainfall_diviations.size
  end
end

run_cli
