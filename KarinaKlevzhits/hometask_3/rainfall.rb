#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'lib/messenger'

MONTHS = 12

def run_cli
  loop do
    Messenger.print_city_alert
    city = gets.chomp
    break if exit?(city)

    if city.empty?
      Messenger.print_empty_alert
    else
      results(city)
    end
  end
end

def results(city)
  data = data_parse(city)
  mean = calculate_mean(data)
  variance = calculate_variance(data)
  Messenger.print_result_mean(mean)
  Messenger.print_result_variance(variance)
end

def data_parse(city)
  read_data.split("\n")
           .select { |line| line.split(':').shift == city }
           .join
           .gsub(/[^0-9,.]/, '')
           .split(',')
           .map(&:to_f)
end

def exit?(city)
  city.eql?('exit!')
end

def calculate_variance(fall)
  calculate_mean(fall).eql?(-1) ? -1 : fall.map { |i| (i - calculate_mean(fall))**2 }.sum / MONTHS
end

def calculate_mean(fall)
  fall.size.eql?(0) ? -1 : fall.sum / MONTHS
end

def read_data
  File.open('data.txt').read
end

run_cli
