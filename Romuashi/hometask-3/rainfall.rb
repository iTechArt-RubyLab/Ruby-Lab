#!/usr/bin/env ruby
# frozen_string_literal: true
require 'colorize'

def data
  file = File.new('data')
  file.read
end

def mean(town, data)
  return -1 unless data.include?(town)

  search_town(town, data).sum / 12
end

def variance(town, data)
  return -1 unless data.include?(town)

  search_town(town, data).map { |city| (mean(town, data) - city)**2 }.sum / 12
end

def search_town(town, data)
  data.split("\n").each do |line|
    return line.scan(/\d*\.\d/).map(&:to_f) if line.include?(town)
  end
end

def run_cli
  loop do
    p 'Enter your string: '
    text = gets.chomp
    break if text == 'exit!'

    if text.empty?
      p "String can't be blank!"
    else
      show_result(text)
    end
  end
end

def show_result(input)
  puts "Rainfall mean: #{mean(input, data)}"
  puts "Rainfall variance: #{variance(input, data)}"
end

run_cli
