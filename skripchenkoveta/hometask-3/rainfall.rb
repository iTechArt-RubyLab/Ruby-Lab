# frozen_string_literal: true

EXIT_COMMAND = 'exit!'

def data_extraction
  file = File.new('data.txt', 'r:UTF-8')
  file.read
end

def town_search(town, str)
  str = str.split("\n")
  str.each do |i|
    next unless i.include? town

    return i
  end
end

def extracting_numbers(str)
  str.scan(/\d*\.\d/).map(&:to_f)
end

def calculate_middle_rainfall(town, str)
  avg = 0.0
  return -1.0 unless str.include? town

  str = town_search(town, str)
  str = extracting_numbers(str)
  str.each do |k|
    avg += k
  end
  avg / 12
end

def calculate_variance(town, str)
  varian = 0.0
  return -1.0 unless str.include? town

  arr_second = town_search(town, str)
  arr_third = extracting_numbers(arr_second)
  arr_third.each do |k|
    varian += (calculate_middle_rainfall(town, str) - k)**2
  end
  varian / 12
end

def run_cli
  loop do
    print 'Enter city name: '
    str = gets.chomp
    break if str == EXIT_COMMAND

    if str.empty?
      puts 'City name can not be blank!'
    else
      puts "Rainfall mean: #{calculate_middle_rainfall(str, data_extraction)} Rainfall variance: #{calculate_variance(str, data_extraction)}"
    end
  end
end
run_cli
