# frozen_string_literal: true

module Scrapper
  # this class generate report
  class ReportGenerator
    def initialize(parsed_data)
      @parsed_data = parsed_data
    end

    def call
      @parsed_data
    end
  end
end
