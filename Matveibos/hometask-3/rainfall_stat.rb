# frozen_string_literal: true

# this class is used for calculate mean and variance values for town rainfall
class RainfallStat
  SEPARATOR = ':'
  REGULAR = /\d*\.\d/.freeze

  def mean
    create_hash

    calc_mean
  end

  def variance
    create_hash

    calc_variance
  end

  private

  def initialize(town, data)
    @town = town
    @data = data
    @processed_data = {}
  end

  def create_hash
    @data.each_line do |str|
      key = str.split(SEPARATOR).first
      array = str.scan(REGULAR).map(&:to_f)
      @processed_data[key] = array
    end
  end

  def calc_mean
    replace(@town).sum / replace(@town).size
  end

  def calc_variance
    replace(@town).inject(0) { |var, n| var + (n - calc_mean)**2 / replace(@town).size }
  end

  def replace(town)
    @processed_data[town]
  end
end
