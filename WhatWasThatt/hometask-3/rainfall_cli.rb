# frozen_string_literal: true

require_relative './lib/calculators/rainfall/calculator'

# Service to receiving data and return result
class RainfallCli
  def initialize(data_path)
    @data_path = data_path
  end

  def run_cli
    data.success? ? run : print_data_error_message
  end

  private

  attr_accessor :city, :data_path

  EXIT_COMMANDS = %w[exit! !!! exit].freeze
  WEATHER_INDICATORS = %i[mean variance].freeze

  def run
    loop do
      print_info_message
      read_city
      break if exit?

      if city.empty?
        print_error_message
        next
      end
      print_weather_indicators
    end
  end

  def data
    @data ||= Utils::DataReader.new(data_path).call
  end

  def read_city
    @city = gets.chomp
  end

  def print_data_error_message
    puts data.error_message
  end

  def print_info_message
    puts 'Enter city name: '
  end

  def print_error_message
    puts 'City can not be blank!'
  end

  def exit?
    EXIT_COMMANDS.include?(city)
  end

  def calculate_indecator(weather_indicator)
    Calculators::Rainfall::Calculator.new(data.data, city, weather_indicator).call
  end

  def print_weather_indicator(weather_indicator)
    puts("Rainfall #{weather_indicator} #{calculate_indecator(weather_indicator)}")
  end

  def print_weather_indicators
    WEATHER_INDICATORS.each { |weather_indicator| print_weather_indicator(weather_indicator) }
  end
end

RainfallCli.new('data.txt').run_cli
