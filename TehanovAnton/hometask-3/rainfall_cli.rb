# frozen_string_literal: true

require './rainfall_statistics'

# RainfallCli designed to initialise data for run_cli method
class RainfallCli
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
    @data ||= File.open('rainfall_data').read
  end
end
