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

  str = town_search(town, str)
  str = extracting_numbers(str)
  str.each do |k|
    varian += (calculate_middle_rainfall(town, str) - k)**2
  end
  varian / 12
end

def show_result(town)
  puts "Rainfall mean: #{calculate_middle_rainfall(town, data_extraction)}"
  puts "Rainfall variance: #{calculate_variance(town, data_extraction)}"
end

def run_cli
  loop do
    print 'Enter city name: '
    str = gets.chomp
    break if str == EXIT_COMMAND

    if str.empty?
      puts 'City name can not be blank!'
    else
      show_result(str)
    end
  end
end
run_cli
