#!/usr/bin/env ruby
# frozen_string_literal: true
<<<<<<< HEAD

ENTER_STRING = 'Enter your string: '
BLANCK_STRING = 'String can not be blank!'
EXIT = 'exit!'
<<<<<<< HEAD
=======
>>>>>>> parent of 70e274e (Update rainfall.rb)
=======
>>>>>>> eaf9850 (Update rainfall.rb)
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
  enter_norm = "#{town}:Jan (.*)"
  match = data.match(enter_norm)
  match.nil? ? [] : match[1].split(/,\d+\d/).map(&:to_f)
end

def run_cli
  loop do
    p ENTER_STRING
    text = gets.chomp
    break if text == EXIT

    if text.empty?
      p BLANCK_STRING
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
