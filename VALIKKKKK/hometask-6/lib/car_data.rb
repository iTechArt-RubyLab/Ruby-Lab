# frozen_string_literal: true

require 'virtus'

class CarData
  include Virtus.model

  attribute :model, String
  attribute :year, Integer
  attribute :price, Float
  attribute :city, String
  attribute :link, String
end
