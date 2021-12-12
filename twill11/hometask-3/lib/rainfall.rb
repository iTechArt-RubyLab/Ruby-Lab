# frozen_string_literal: true

require_relative 'data_converter'
require_relative 'data_reader'

# Formatting data
class Rainfall
  include DataConverter
  include DataReader

  MONTHS = 12

  def initialize(data_path)
    @data_path = data_path
  end

  def mean_result(town)
    mean(data(town))
  end

  def variance_result(town)
    variance(data(town))
  end

  private

  attr_reader :data_path

  def data(town)
    values_recorder(town, read_file(data_path))
  end

  def mean(data)
    data.sum / MONTHS
  end

  def variance(data)
    data.map { |value| (value - mean(data))**2 }.sum / MONTHS
  end
end
