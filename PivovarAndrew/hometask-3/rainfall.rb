# !/usr/bin/env ruby
# frozen_string_literal: false

STOP_WORD = 'exit!'.freeze
ERROR_MESSAGE = 'String can not be blank!'.freeze
DATA_FILE_NAME = 'data.txt'.freeze
ENTER_MESSAGE = 'Enter city name: '.freeze

# Class for the implementation of operations related to files
class FileService
  def write_data_to_file(data, file_name)
    File.open(file_name, 'w') { |file| file.write(data) }
  end
end

# Class for the implementation of operations related to rainfalls
class GenerateRainfallData
  TOWNS = %w[Rome London Paris NY Vancouver Sydney Bangkok
             Tokyo Beijing Lima Montevideo Caracas Madrid Berlin].freeze
  MONTHES = %w[Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec].freeze

  MIN_RAINFALLS_COUNT = 0.1.freeze
  MAX_RAINFALLS_COUNT = 300.0.freeze
  RAINFALL_ACCURACY = 1.freeze

  def generate_data
    TOWNS.map.each_with_object(String.new) do |town, memo|
      memo << "#{town}:#{generate_rainfalls.join(',')}"
      memo << "\n"
    end
  end

  private

  def generate_rainfalls
    min_generated_value = rand(MIN_RAINFALLS_COUNT..MAX_RAINFALLS_COUNT)
    max_generated_value = min_generated_value * 1.5
    MONTHES.map do |month|
      "#{month} #{rand(min_generated_value..max_generated_value).round(RAINFALL_ACCURACY)}"
    end
  end
end

# Class to describe rainfall characteristics
class Rainfall
  attr_reader :data
  attr_accessor :town

  def initialize(town = +'', data = GenerateRainfallData.new.generate_data)
    @town = town
    @data = data
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
    data_contain_town? ? rainfalls.map { |rainfall| (rainfall - mean)**2 }.sum / rainfalls.length : -1
  end

  private

  def parse_data
    data.split("\n").map { |data_str| data_str.split(':') }.to_h
  end
end

def run_cli
  rainfall = Rainfall.new
  FileService.new.write_data_to_file(rainfall.data, DATA_FILE_NAME)
  loop do
    print ENTER_MESSAGE
    city_name = gets.chomp
    if city_name == STOP_WORD
      exit!
    elsif city_name.empty?
      puts ERROR_MESSAGE
    else
      rainfall.town = city_name
      puts "Rainfall mean: #{rainfall.mean}"
      puts "Rainfall varince: #{rainfall.variance}"
    end
  end
end

run_cli
