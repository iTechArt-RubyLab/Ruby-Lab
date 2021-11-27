# frozen_string_literal: true

require 'csv'

module Scrapper
  # this class writes data into file
  class FileWriter
    REPORTS_PATH = 'reports/'
    EXTENSION = '.csv'
    HEADERS = ['Section', 'Title', 'Image URL', 'Symbols'].freeze

    attr_reader :report

    def initialize(report)
      @report = report
    end

    def call
      CSV.open(path_generator, 'wb') do |csv|
        csv << HEADERS

        report.each do |row|
          csv << row
        end
      end
    end

    private

    def path_generator
      REPORTS_PATH + Time.now.strftime('%d_%m_%Y_%H%M') + EXTENSION
    end
  end
end
