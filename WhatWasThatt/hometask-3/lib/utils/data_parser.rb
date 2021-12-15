# frozen_string_literal: true

require 'ostruct'

# Data processing module
module Utils
  # Class to parse data from string to array with float numbers
  class DataParser
    def initialize(towns_rainfall, town)
      @towns_rainfall = towns_rainfall
      @town = town
    end

    def call
      OpenStruct.new(success?: parse_success?, data: rainfall_collection)
    end

    private

    attr_accessor :town, :towns_rainfall

    NUMBERS_REGEX = /[0-9]+.[0-9]+/.freeze

    def parse_success?
      !towns_rainfall_collection.fetch(town, nil).nil?
    end

    def towns_rainfall_collection
      towns_rainfall.split("\n").map { |town_temp| town_temp.split(':') }.to_h
    end

    def rainfall_collection
      towns_rainfall_collection[town]&.scan(NUMBERS_REGEX)&.map(&:to_f)
    end
  end
end
