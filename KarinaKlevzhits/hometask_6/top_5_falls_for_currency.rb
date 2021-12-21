#!/usr/bin/ruby
# frozen_string_literal: true

require 'open-uri'
require 'http'
require './lib/data_loader'
require './lib/data_parser'
config = {
  url: 'https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml?d77b9d32811c6036126e2d3d784a0ee0'
}
# class currency
class Currency
  def initialize(config)
    @url = config[:url]
  end

  def call
    currencies
    parsed_data
  end

  def currencies
    DataLoader.new(url).call
  end

  def parsed_data
    DataParser.new.call
  end

  private

  attr_accessor :url
end
a = Currency.new(config).call
p a
