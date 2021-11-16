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

      input.empty? ? (puts ERROR_MESSAGE) : rainfall_statistics(input)

      show(@rainfall_statistics)
      show2(@rainfall_statistics)
    end
  end

  private

  def data
    @data ||= File.open('data.txt').read
  end

  def rainfall_statistics(input)
    @rainfall_statistics ||= RainfallStat.new(input, data)
  end

  def show(statistics)
    puts "Rainfall mean: #{statistics.mean}"
    puts "Rainfall variance: #{statistics.variance}"
  end

  def show2(statistics)
    puts "Mean: #{statistics.mean} Variance: #{statistics.variance}"
  end
end
