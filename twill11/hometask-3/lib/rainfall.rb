# frozen_string_literal: true

require_relative 'data_converter'
require_relative 'data_reader'

# Formatting data
class Rainfall
  MONTHS = 12
  def initialize(data_path)
    @data_path = data_path
  end

  def mean_result(town)
    mean(converted_data.values_recorder(town, data_reader))
  end

  def variance_result(town)
    variance(converted_data.values_recorder(town, data_reader))
  end

  private

  attr_reader :data_path

  def mean(data)
    data.sum / MONTHS
  end

  def variance(data)
    data.map { |value| (value - mean(data))**2 }.sum / MONTHS
  end

  def converted_data
    @converted_data ||= DataConverter.new
  end

  def data_reader
    @data_reader ||= DataReader.new.read_file(data_path)
  end
end
