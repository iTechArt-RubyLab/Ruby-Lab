# frozen_string_literal: true

# Include calculators collection
module Calculators
  # Include rainfall calculators
  module Rainfall
    # Include rainfall operations
    module Operations
      # Base interface for rainfall calculators
      module Base
        MONTHS = 12

        def call
          raise 'Not implemented yet'
        end
      end
    end
  end
end
