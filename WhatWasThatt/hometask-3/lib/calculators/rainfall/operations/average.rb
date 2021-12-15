# frozen_string_literal: true

require_relative './base'

# Include calculators collection
module Calculators
  # Include rainfall calculators
  module Rainfall
    # Include rainfall operations
    module Operations
      # Class to calculate average rainfall
      class Average
        include Base

        def initialize(rainfall)
          @rainfall = rainfall
        end

        def call
          rainfall.sum / Base::MONTHS
        end

        private

        attr_accessor :rainfall
      end
    end
  end
end
