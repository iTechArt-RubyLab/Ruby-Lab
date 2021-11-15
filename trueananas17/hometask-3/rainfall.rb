#!/usr/bin/env ruby

# frozen_string_literal: true

data = File.new("data.txt", "r:UTF-8").read

def run_cli(data)
  loop do
    puts 'Enter city name'
    town = gets.chomp.to_s
    break if town == 'exit!'

    town.empty? ? (puts 'City name can not be blank!') : (output(parsed_town_data(town, data)))
  end
end

def output(town_data)
  print 'Rainfall mean: '
  puts mean(town_data)
  print 'Rainfall variance: '
  puts variance(town_data)
end

  def mean(town_data)
    town_data.sum / 12
  end

  def parsed_town_data(town, data)
    town_row(town, data).scan(/\d+[,.]\d+/).map!(&:to_f)
  end

  def town_row(town, data)
    data.split("\n").find {|row| row.start_with?(town)}
  end

  def variance(town_data)
    sum = 0
    town_data.each do |data|
      sum += (data-mean(town_data))**2
    end
    sum
  end

run_cli(data)
