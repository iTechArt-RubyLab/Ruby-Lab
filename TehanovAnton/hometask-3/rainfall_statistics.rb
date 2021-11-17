# frozen_string_literal: true

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
