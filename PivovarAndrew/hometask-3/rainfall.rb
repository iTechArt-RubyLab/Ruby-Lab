# !/usr/bin/env ruby
# frozen_string_literal: true

STOP_WORD = "exit!"
ERROR_MESSAGE = "String can not be blank!"

class RainfallController
  TOWNS = ["Rome", "London", "Paris", "NY", "Vancouver", "Sydney", "Bangkok", "Tokyo",
           "Beijing", "Lima", "Montevideo", "Caracas", "Madrid", "Berlin"]

  MONTHES = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

  MIN_RAINFALLS_COUNT = 0.1
  MAX_RAINFALLS_COUNT = 300.0
  RAINFALL_ACCURACY = 1
  DATA_FILE_NAME = "data.txt"

  attr_reader :data
  attr_accessor :town

  def initialize(town, data)
    @town = town
    @data = data
  end

  def initialize
    @town = +""
    @data = +""
  end

  def generate_data
    random = Random.new
    TOWNS.each { |town|
      @data << "#{town}:"
      @data << monthes_with_rainfalls.compact.join(",")
      @data << "\n"
    }
  end

  def write_data_to_file
    File.open(DATA_FILE_NAME, "w") { |file| file.write(data) }
  end

  def average
    rainfalls.sum / rainfalls.length
  end

  def data_contain_town?
    data.match(/^#{town}/)
  end

  def rainfalls
    parse_data[town].scan(/\d+.\d+/).map(&:to_f)
  end

  def mean
    is_data_contain_town? ? average : -1
  end

  def variance
    is_data_contain_town? ? rainfalls.map { |element| (element - mean) ** 2 }.sum / rainfalls.length : -1
  end

  private

  def parse_data
    data.split("\n").map { |str| str.split(":") }.to_h
  end

  def monthes_with_rainfalls
    min_generated_value = random.rand(MIN_RAINFALLS_COUNT..MAX_RAINFALLS_COUNT)
    max_generated_value = min_generated_value * 1.5
    town_info = Array.new
    MONTHES.each { |month|
      town_info << "#{month} #{random.rand(min_generated_value..max_generated_value).round(RAINFALL_ACCURACY)}"
    }
    town_info << nil
  end
end

def run_cli
  rainfall_controller = RainfallController.new
  rainfall_controller.generate_data
  rainfall_controller.write_data_to_file
  loop do
    print "Enter city name: "
    city_name = gets.chomp
    if city_name == STOP_WORD
      exit!
    elsif city_name.empty?
      puts ERROR_MESSAGE
    else
      rainfall_controller.town = city_name
      puts "Rainfall mean: #{rainfall_controller.mean}"
      puts "Rainfall varince: #{rainfall_controller.variance}"
    end
  end
end

run_cli
