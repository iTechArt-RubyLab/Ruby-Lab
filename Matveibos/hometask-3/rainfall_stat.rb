# frozen_string_literal: true

# this class is used for calculate mean and variance values for town rainfall
class RainfallStat
  SEPARATOR = ':'
  CHOOSING_NUMBERS = /\d*\.\d/.freeze

  def initialize(town, data)
    @town = town
    @data = data
    @processed_data = process_data
    rainfall_data_for(town)
  end

  def mean
    @rainfall_data_for.sum / @rainfall_data_for.size
  end

  def variance
    @rainfall_data_for.inject(0) { |var, n| var + (n - mean)**2 / @rainfall_data_for.size }
  end

  private

  attr_reader :town, :data

  def process_data
    data.each_line.each_with_object({}) do |line, processed_data|
      processed_data[line.split(SEPARATOR).first] = line.scan(CHOOSING_NUMBERS).map(&:to_f)
    end
  end

  def rainfall_data_for(town)
    @rainfall_data_for ||= @processed_data[town]
    puts @rainfall_data_for.class
  end
end
