# frozen_string_literal: true

require 'csv'
require 'time'

# Class write cars info in file
class FileWriter
  def initialize(cars)
    @file_name = "ab_#{Time.now.strftime('%d-%m-%Y')}.csv"
    @cars = cars
  end

  def call
    fill_headers
    fill_cars
  end

  private

  attr_reader :cars

  def fill_headers
    CSV.open(@file_name, 'w') { |csv| csv << %w[модель год цена$ город ссылка] }
  end

  def fill_cars
    CSV.open(@file_name, 'ab') do |csv|
      cars.each { |carsdata| carsdata.cars.each { |car| csv << car.attributes.values } }
    end
  end
end
