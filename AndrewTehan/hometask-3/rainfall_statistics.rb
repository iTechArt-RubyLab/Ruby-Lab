# frozen_string_literal: true

require './math_functions'

# this class is used for calculate mean and variance values for town rainfall
class RainfallStatistics
  include MathFunctions

  TOWN_METRICS_PATTERN = /\d*\.\d*/.freeze

  def initialize(town, data)
    @town = town
    @data = data
  end

  def mean
    town_exists? { calculate_average(extract_statistic_values) }
  end

  def variance
    town_exists? { calculate_variance(calculate_mean_differences) }
  end

  def town_exists?(&calculations)
    missing_data? ? -1 : calculations.call
  end

  private

  attr_reader :town, :data

  def extract_statistic_values
    @extract_statistic_values ||= find_town_statistics.scan(TOWN_METRICS_PATTERN).map(&:to_f)
  end

  def missing_data?
    !find_town_statistics
  end

  def find_town_statistics
    @find_town_statistics ||= data.each_line.find do |line|
      line.start_with?(town)
    end
  end

  def calculate_mean_differences
    extract_statistic_values.map { |town_monthly_rainfall| town_monthly_rainfall - mean }
  end
end
