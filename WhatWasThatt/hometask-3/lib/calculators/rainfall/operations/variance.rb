# frozen_string_literal: true

require_relative './base'

# Include calculators collection
module Calculators
  # Include rainfall calculators
  module Rainfall
    # Include rainfall operations
    module Operations
      # Class to calculate variance rainfall
      class Variance
        include Base

        def initialize(rainfall)
          @rainfall = rainfall
        end

        def call
          rainfall.map { |rainfall_item| (rainfall_item - average)**2 }.sum / MONTHS
        end

        private

        attr_accessor :rainfall

        def average
          @average ||= Average.new(rainfall).call
        end
      end
    end
  end
end
