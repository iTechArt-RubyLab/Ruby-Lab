# frozen_string_literal: true

require 'csv'

module Scrapper
  # this class writes data into file
  class FileWriter
    REPORTS_PATH = 'reports/'
    EXTENSION = '.csv'
    HEADERS = ['Section', 'Title', 'Image URL'].freeze

    attr_reader :report

    def initialize(report)
      @report = report
    end

    def call
      file_name = Time.now.strftime('%d_%m_%Y_%H%M')
      file_path = REPORTS_PATH + file_name + EXTENSION

      CSV.open(file_path, 'wb') do |csv|
        csv << HEADERS

        report.each do |row|
          csv << row
        end
      end
    end
  end
end
