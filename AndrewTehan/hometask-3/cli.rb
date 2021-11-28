# frozen_string_literal: true

# this class contains describes cli for rainfall stats
class Cli
  ENTER_MESSAGE = 'Enter city name: '
  ERROR_MESSAGE = 'City name can not be blank!'
  EXIT_MESSAGE = 'exit!'

  def run
    loop do
      input = wait_for_input

      exit if input == EXIT_MESSAGE

      input.empty? ? show_error : show_result(input)
    end
  end

  private

  def wait_for_input
    print ENTER_MESSAGE
    gets.chomp
  end

  def show_error
    puts ERROR_MESSAGE
  end

  def show_result(input)
    statistics = RainfallStatistics.new(input, data)

    puts "Rainfall mean: #{statistics.mean}"
    puts "Rainfall variance: #{statistics.variance}"
  end

  def data
    @data ||= File.open('data').read
  end
end
