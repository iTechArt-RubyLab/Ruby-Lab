#!/usr/bin/ruby
# frozen_string_literal: true

require 'open-uri'
require 'http'
require './data_loader'
equire './data_parser'

# class currency
class Currency
  def call
    get_currencies
    parsed_data
  end

  def currencies
    DataLoader.new.call
  end

  def parsed_data
    DataParser.new.call
  end
end
a = Currency.new.call
p a
