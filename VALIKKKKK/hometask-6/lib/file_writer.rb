# frozen_string_literal: true

require 'csv'
require 'time'

# Class write cars info in file
class FileWriter
  HEADERS = %w[модель год цена$ город ссылка].freeze

  def initialize(cars)
    @file_name = "ab_#{Time.now.strftime('%d-%m-%Y')}.csv"
    @cars = cars
  end

  def call
    fill_cars
  end

  private

  attr_reader :cars

  def fill_cars
    CSV.open(@file_name, 'w', write_headers: true, headers: HEADERS) do |csv|
      cars.each { |carsdata| carsdata.cars.each { |car| csv << car.attributes.values } }
    end
  end
end
