#!/usr/bin/env ruby
# frozen_string_literal: true

require './data/rainfalls'
require './data/towns'
require './run'

# This class calculate the average and the variance of town rainfalls
class Rainfall
  extend RunCli
  attr_accessor :town, :data

  def initialize(town:, data:)
    @town = town
    @data = data
  end

  def mean
    return -1 if town_info.empty?

    average
  end

  def variance
    return -1 if town_info.empty?

    parsed_values.reduce(0) { |y, x| y + (x - average)**2 / parsed_values.length.to_f }
  end

  private

  def town_info
    TOWNS.include?(town) ? data.split(/\n/).select { |str| str.include?(town) } : ''
  end

  def parsed_values
    town_info[0].scan(/\d+.\d+/).map(&:to_f)
  end

  def average
    parsed_values.sum / parsed_values.length
  end
end

Rainfall.run_cli
