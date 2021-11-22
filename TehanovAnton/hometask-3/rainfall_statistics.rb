# frozen_string_literal: true

# RainfallStatistics designed to calculate mean and variance values
class RainfallStatistics
  attr_reader :city, :data

  def initialize(city, data)
    @city = city
    @data = data
  end

  def mean
    return -1 if missing_data?

    average(rainfall_values)
  end

  def variance
    return -1 if missing_data?

    variance_result(rainfall_diviations)
  end

  private

  def find_town_rainfall_data
    return if city.empty?

    @find_town_rainfall_data ||= data.each_line.find do |town_rainfall_data|
      town_rainfall_data.start_with?("#{city}:")
    end
  end

  def missing_data?
    !find_town_rainfall_data
  end

  def rainfall_values
    @rainfall_values ||= find_town_rainfall_data.scan(/\d+.\d+/).map(&:to_f)
  end

  def average(values)
    values.sum / values.size
  end

  def rainfall_diviations
    rainfall_values.map { |value| value - mean }
  end

  def variance_result(rainfall_diviations)
    sum_squared_diviations = rainfall_diviations.sum { |el| el**2 }
    sum_squared_diviations / rainfall_diviations.size
  end
end
