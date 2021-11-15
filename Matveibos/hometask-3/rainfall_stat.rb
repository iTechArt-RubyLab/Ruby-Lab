# frozen_string_literal: true

# this class is used for calculate mean and variance values for town rainfall
class RainfallStatistics
  attr_reader :town, :data

  def initialize(town, data)
    @town = town
    @data = data
    @hash = {}
  end

  def mean
    return -1 unless create_hash

    calc_mean
  end

  def variance
    return -1 unless create_hash

    calc_variance
  end

  private

  def create_hash
    @data.each_line do |str|
      key = str.split(':').first
      array = str.scan(/\d*\.\d/).map(&:to_f)
      @hash[key] = array
    end
  end

  def calc_mean
    mean = @hash[@town].sum / @hash[@town].size
    @means = mean
  end

  def calc_variance
    variance = 0
    @hash[@town].each do |el|
      variance += (el - calc_mean)**2 / @hash[@town].size
    end
    variance
  end
end
