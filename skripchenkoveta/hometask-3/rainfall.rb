# frozen_string_literal: true

ENTER_MESSAGE = 'Enter city name: '
ERROR_MESSAGE = 'City name can not be blank!'
EXIT_COMMAND = 'exit!'
MONTHS_IN_YEAR = 12

def rainfall_string
  file = File.new('data.txt', 'r:UTF-8')
  file.read
end

def town_search(town, rainfall_string)
  rainfall_string = rainfall_string.split("\n")
  rainfall_string.find { |value| value.include? town }
end

def extract_numbers(rainfall_string)
  rainfall_string.scan(/\d*\.\d/).map(&:to_f)
end

def calculate_middle_rainfall(town, rainfall_string)
  return -1.0 unless rainfall_string.include? town

  rainfall_average = 0.0
  rainfall_string = town_search(town, rainfall_string)
  rainfall_values = extract_numbers(rainfall_string)
  rainfall_values.each do |value|
    rainfall_average += value
  end
  rainfall_average / MONTHS_IN_YEAR
end

def calculate_variance(town, rainfall_string)
  return -1.0 unless rainfall_string.include? town

  rainfall_variance = 0.0
  rainfall_string = town_search(town, rainfall_string)
  rainfall_values = extract_numbers(rainfall_string)
  rainfall_values.each do |value|
    rainfall_variance += (calculate_middle_rainfall(town, rainfall_string) - value)**2
  end
  rainfall_variance / MONTHS_IN_YEAR
end

def show_result(town)
  puts "Rainfall mean: #{calculate_middle_rainfall(town, rainfall_string)}"
  puts "Rainfall variance: #{calculate_variance(town, rainfall_string)}"
end

def run_cli
  loop do
    print ENTER_MESSAGE
    city = gets.chomp
    break if city == EXIT_COMMAND

    if city.empty?
      puts ERROR_MESSAGE
    else
      show_result(city)
    end
  end
end
run_cli
