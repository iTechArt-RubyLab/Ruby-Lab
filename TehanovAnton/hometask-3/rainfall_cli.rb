# frozen_string_literal: true

require './rainfall_statistics'

# RainfallCli designed to initialize data for run_cli method
class RainfallCli
  def initialize(data_file)
    @data_file = data_file
  end

  def run_cli
    loop do
      puts 'Enter city name:'
      input = gets.chomp

      break if input == 'exit!'

      show_error_message if input.empty?
      show_result(input)
    end
  end

  private

  def show_error_message
    puts "City name can't be blank"
  end

  def show_result(city)
    statistics = RainfallStatistics.new(city, data)
    puts "Rainfall mean: #{statistics.mean}"
    puts "Rainfall variance: #{statistics.variance}"
  end

  def data
    @data ||= File.open(@data_file).read
  end
end
