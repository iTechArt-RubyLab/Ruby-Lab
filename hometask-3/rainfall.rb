# frozen_string_literal: true

def mean(town, data)
  RainfallStatistics.new(town, data).mean
end

def variance(town, data)
  RainfallStatistics.new(town, data).variance
end

# this class is used for calculate mean and variance values for town
class RainfallStatistics
  attr_reader :town, :data

  def initialize(town, data)
    @town = town
    @data = data
  end

  def mean
    return -1 unless town && data.include?("#{town}:")

    average(extract_statistic_values)
  end

  def variance
    return -1 unless town && data.include?("#{town}:")

    calculate_variance(calculate_mean_differences)
  end

  private

  def extract_statistic_values
    @extract_statistic_values ||= find_town_statistics.scan(/[0-9]*\.[0-9]*/).map(&:to_f)
  end

  def find_town_statistics
    @find_town_statistics ||= data.each_line.find do |line|
      line.include?(town)
    end
  end

  def calculate_mean_differences
    extract_statistic_values.map { |town_monthly_rainfall| town_monthly_rainfall - mean }
  end

  def average(values)
    values.sum(&:to_f) / values.size
  end

  def calculate_variance(values)
    values.sum { |value| value**2 } / values.size
  end
end
