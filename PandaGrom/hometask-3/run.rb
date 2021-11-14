# frozen_string_literal: true

# This module asks the user to enter data
module RunCli
  def run_cli
    loop do
      input_town = users_input_town

      break if input_town == 'exit!'

      input_year = users_input_year

      if input_town.empty?
        error
      else
        input_year == '2020' ? show(input_town, LAST_YEAR) : show(input_town, THE_YEAR_BEFORE_LAST)
      end
    end
  end

  private

  def users_input_town
    print 'Enter city name: '
    gets.chomp
  end

  def users_input_year
    print 'Enter a year: '
    gets.chomp
  end

  def error
    puts "City/year name can not be blank!\n\n"
  end

  def show(input_town, input_year)
    town = Rainfall.new(town: input_town, strng: input_year)

    puts "Rainfall mean: #{town.mean}"
    puts "Rainfall variance: #{town.variance}\n\n"
  end
end
