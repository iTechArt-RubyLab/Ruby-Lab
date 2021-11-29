# !/usr/bin/env ruby
# frozen_string_literal: true

require 'csv'

# Class responsible for setup web driver
class CSVWriter
  attr_reader :data

  DATA_PATH = './file/data.csv'
  DATA_HEADER = %w[Title Image_URL Text].freeze

  def initialize(data)
    @data = data
  end

  def import_to_csv
    CSV.open(DATA_PATH, 'wb') do |csv|
      csv << DATA_HEADER
      @data.each do |section|
        csv << [section[:title], section[:image_url], section[:text]]
      end
    end
  end
end
