# !/usr/bin/env ruby
# frozen_string_literal: false

STOP_WORD = "exit!"
ERROR_MESSAGE = "String can not be blank!"

# Controller for the implementation of operations related to rainfalls
class RainfallController
  TOWNS = %w[Rome London Paris NY Vancouver Sydney Bangkok
             Tokyo Beijing Lima Montevideo Caracas Madrid Berlin]

  MONTHES = %w[Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec]

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
    TOWNS.each do |town|
      @data << "#{town}:"
      @data << self.generate_rainfalls.compact.join(",")
      @data << "\n"
    end
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
    data_contain_town? ? average : -1
  end

  def variance
    data_contain_town? ? rainfalls.map { |rainfall| (rainfall - mean) ** 2 }.sum / rainfalls.length : -1
  end

  private

  def parse_data
    data.split("\n").map { |data_str| data_str.split(":") }.to_h
  end

  def generate_rainfalls
    random = Random.new
    min_generated_value = random.rand(MIN_RAINFALLS_COUNT..MAX_RAINFALLS_COUNT)
    max_generated_value = min_generated_value * 1.5
    rainfalls_info = []
    MONTHES.each do |month|
      rainfalls_info << "#{month} #{random.rand(min_generated_value..max_generated_value).round(RAINFALL_ACCURACY)}"
    end
    rainfalls_info << nil
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
