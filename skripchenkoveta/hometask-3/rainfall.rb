# frozen_string_literal: true

EXIT_COMMAND = 'exit!'

def rainfall_string
  file = File.new('data.txt', 'r:UTF-8')
  file.read
end

def town_searching(town_rainfall, string_rainfall)
  string_rainfall = string_rainfall.split("\n")
  string_rainfall.find { |value| value.include? town_rainfall }
end

def extract_numbers(string_rainfall)
  string_rainfall.scan(/\d*\.\d/).map(&:to_f)
end

def calculate_middle_rainfall(town_rainfall, string_rainfall)
  return -1.0 unless string_rainfall.include? town_rainfall

  average_rainfall = 0.0
  string_rainfall = town_searching(town_rainfall, string_rainfall)
  values_rainfall = extract_numbers(string_rainfall)
  values_rainfall.each do |value|
    average_rainfall += value
  end
  average_rainfall / 12
end

def calculate_variance(town_rainfall, string_rainfall)
  return -1.0 unless string_rainfall.include? town_rainfall

  variance_rainfall = 0.0
  string_rainfall = town_searching(town_rainfall, string_rainfall)
  values_rainfall = extract_numbers(string_rainfall)
  values_rainfall.each do |value|
    variance_rainfall += (calculate_middle_rainfall(town_rainfall, string_rainfall) - value)**2
  end
  variance_rainfall / 12
end

def show_result(town_rainfall)
  puts "Rainfall mean: #{calculate_middle_rainfall(town_rainfall, rainfall_string)}"
  puts "Rainfall variance: #{calculate_variance(town_rainfall, rainfall_string)}"
end

def run_cli
  loop do
    print 'Enter city name: '
    city = gets.chomp
    break if city == EXIT_COMMAND

    if city.empty?
      puts 'City name can not be blank!'
    else
      show_result(city)
    end
  end
end
run_cli
