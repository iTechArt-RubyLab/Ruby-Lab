# frozen_string_literal: true

require 'httparty'
require_relative 'response_parser'

# Class fetch requests with filters, call parser and return result
class DataFetcher
  BASE_API = 'https://ab.onliner.by/sdapi/ab.api/search/vehicles'

  AUDI_FILTER = {
    query: {
      'engine_type[0]': 'diesel',
      'year[from]': 2015,
      'price': { 'from': 20_000, 'to': 30_000, 'currency': 'USD' },
      'car[0][manufacturer]': 2,
      'extended': 'true',
      'limit': 3
    }
  }.freeze

  BMW_FILTER = {
    query: {
      'year[from]': 2010,
      'price': { 'from': 10_000, 'to': 15_000, 'currency': 'USD' },
      'car[0][manufacturer]': 5,
      'extended': 'true',
      'limit': 3
    }
  }.freeze

  MERCEDES_BENZ_FILTER = {
    query: {
      'year[from]': 2018,
      'price': { '[from]': 20_000, 'price[currency]': 'USD' },
      'car[0][manufacturer]': 41,
      'extended': 'true',
      'limit': 3
    }
  }.freeze

  CARS_FILTER_ARRAY = [AUDI_FILTER, BMW_FILTER, MERCEDES_BENZ_FILTER].freeze

  def self.call
    cars = []
    CARS_FILTER_ARRAY.each do |filter|
      cars << ResponseParser.new(HTTParty.get(BASE_API, filter)).call
    end
    cars
  end
end
