# frozen_string_literal: true

# this class is used for calculate mean and variance values for town rainfall
class RainfallStat
  SEPARATOR = ':'
  CHOOSING_NUMBERS = /\d*\.\d/.freeze

  def initialize(town, data)
    @town = town
    @data = data
    @processed_data = {}
    create_hash
  end

  def mean
    calc_mean
  end

  def variance
    calc_variance
  end

  private

  def create_hash
    @data.each_line do |str|
      key = str.split(SEPARATOR).first
      array = str.scan(CHOOSING_NUMBERS).map(&:to_f)
      @processed_data[key] = array
    end
  end

  def calc_mean
    rainfall_data_for(@town).sum / rainfall_data_for(@town).size
  end

  def calc_variance
    rainfall_data_for(@town).inject(0) { |var, n| var + (n - calc_mean)**2 / rainfall_data_for(@town).size }
  end

  def rainfall_data_for(town)
    @processed_data[town]
  end
end
