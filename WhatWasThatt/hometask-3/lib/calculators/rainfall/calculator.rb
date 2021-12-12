# frozen_string_literal: true

require_relative './../../utils/data_reader'
require_relative './../../utils/data_parser'
require_relative './operations/average'
require_relative './operations/variance'

# Include calculators collection
module Calculators
  # Include rainfall calculators
  module Rainfall
    # Class to create collection of calculators to calculate different rainfall params
    class Calculator
      def initialize(data, town, calculator_type)
        @data = data
        @town = town
        @calculator_type = calculator_type
      end

      def call
        if parsed_data.success?
          CALCULATORS[calculator_type].new(parsed_data.data).call
        else
          parsing_error
        end
      end

      private

      attr_accessor :data, :town, :calculator_type

      CALCULATORS = {
        mean: Calculators::Rainfall::Operations::Average,
        variance: Calculators::Rainfall::Operations::Variance
      }.freeze

      def parsing_error
        'parsing error'
      end

      def parsed_data
        @parsed_data ||= Utils::DataParser.new(data, town).call
      end
    end
  end
end
