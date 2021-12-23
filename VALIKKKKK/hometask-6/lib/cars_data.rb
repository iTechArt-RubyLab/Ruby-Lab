# frozen_string_literal: true

require 'virtus'
require_relative './car_data'

class CarsData
  include Virtus.model

  attribute :cars, Array[CarData]
end
