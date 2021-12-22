# frozen_string_literal: true

require 'csv'
require_relative 'parser'

# Writing info to csv file
class CsvWriter
  HEADERS = ['photo id', 'person real name', 'photo title', 'link to image'].freeze

  attr_reader :data

  def initialize(data)
    @data = data
  end

  def csv_writer(tag)
    CSV.open("file/#{tag}.csv", 'wb') do |csv|
      csv << HEADERS

      data.each do |row|
        csv << row
      end
    end
  end
end
