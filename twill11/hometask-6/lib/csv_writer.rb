# frozen_string_literal: true

require 'csv'
require_relative 'photo'

# Write info to csv file
class CsvWriter
  attr_reader :photos

  def initialize(photos)
    @photos = photos
  end

  def csv_writer(tag)
    CSV.open("file/#{tag}.csv", 'wb') do |csv|
      csv << Photo::HEADERS
      photos.each do |photo|
        csv << photo.photo_dataset
      end
    end
  end
end
