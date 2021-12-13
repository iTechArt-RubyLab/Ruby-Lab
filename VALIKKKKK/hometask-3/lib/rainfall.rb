# frozen_string_literal: true

# Class Rainfall calculates mean and variance
class Rainfall
  def initialize(city, history)
    @city = city
    @history = history
  end

  def call
    { mean: mean, variance: variance }
  end

  private

  attr_accessor :city, :history

  def parsed_history
    @parsed_history ||= history.split("\n").find { |history_item| history_item.include?(city) }.to_s
  end

  def precipitation
    @precipitation ||= parsed_history.scan(/\d*\.\d/).map(&:to_f)
  end

  def average
    @average ||= precipitation.sum / precipitation.size
  end

  def mean
    precipitation.empty? ? -1 : average
  end

  def variance
    return -1 if precipitation.empty?

    precipitation.map { |precipitation_item| (average - precipitation_item)**2 }.sum / precipitation.size
  end
end
