# frozen_string_literal: true

# this class is used for calculate mean and variance values for town rainfall
class RainfallStat
  SEPARATOR = ':'
  CHOOSING_NUMBERS = /\d*\.\d/.freeze

  def initialize(town, data)
    @town = town
    @data = data
    @processed_data = process_data

  end

  def mean
    rainfall_data_for(town).sum / rainfall_data_for(town).size
  end

  def variance
    rainfall_data_for(town).inject(0) { |var, n| var + (n - mean)**2 / rainfall_data_for(town).size }
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
  end
end
