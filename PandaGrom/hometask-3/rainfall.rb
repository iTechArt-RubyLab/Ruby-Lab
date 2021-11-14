#!/usr/bin/env ruby
# frozen_string_literal: true

require './data/rainfalls'
require './data/towns'
require './run'

# This class calculate average and variance from town rainfalls
class Rainfall
  extend RunCli
  attr_accessor :town, :strng

  def initialize(town:, strng:)
    @town = town
    @strng = strng
  end

  def mean
    return -1 unless find_town

    average
  end

  def variance
    return -1 unless find_town

    calculating_variance
  end

  private

  def find_town
    strng.split(/\n/).find { |str| str.match?(town) }
  end

  def parsing_values
    find_town.scan(/\d+.\d+/).map(&:to_f)
  end

  def average
    parsing_values.sum.to_f / parsing_values.length
  end

  def calculating_variance
    parsing_values.reduce(0) { |y, x| y + (x - average)**2 / parsing_values.length.to_f }
  end
end

Rainfall.run_cli
