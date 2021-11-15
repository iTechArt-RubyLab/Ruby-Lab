# frozen_string_literal: true

ENTER_MESSAGE = 'Enter city name: '
ERROR_MESSAGE = 'City name can not be blank!'
EXIT_MESSAGE = 'exit!'

# this class contains describes cli for rainfall stats
class Cli
  def run_cli
    loop do
      print ENTER_MESSAGE
      input = gets.chomp

      break if input == EXIT_MESSAGE

      input.empty? ? (puts ERROR_MESSAGE) : show_result(input)
    end
  end

  private

  def data
    @data ||= File.open('data.txt').read
  end

  def show_result(input)
    statistics = RainfallStatistics.new(input, data)

    puts "Rainfall mean: #{statistics.mean}"
    puts "Rainfall variance: #{statistics.variance}"
  end
end
