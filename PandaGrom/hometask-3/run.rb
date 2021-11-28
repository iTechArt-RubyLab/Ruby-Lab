# frozen_string_literal: true

# This module asks the user to enter data
module RunCli
  def run_cli
    loop do
      input_town = town

      break if input_town == 'exit!'

      input_year = year

      if input_town.empty?
        error
      else
        input_year == '2020' ? show(input_town, DATA) : show(input_town, DATA1)
      end
    end
  end

  private

  def town
    puts 'Enter city name: '
    gets.chomp
  end

  def year
    puts 'Enter a year (2020 or 2019): '
    gets.chomp
  end

  def error
    puts 'City/year name can not be blank!'
  end

  def show(input_town, input_year)
    town = Rainfall.new(town: input_town, data: input_year)

    puts "Rainfall mean: #{town.mean}"
    puts "Rainfall variance: #{town.variance}"
  end
end
