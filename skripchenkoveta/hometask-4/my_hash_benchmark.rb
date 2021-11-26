# frozen_string_literal: true

require 'benchmark'
require './my_hash'
# rubocop:disable Metrics/BlockLength
Benchmark.bm do |x|
  hash = {}
  my_hash = MyHash.new
  @average_real = 0

  puts 'Creating and writing values in a hash of 100 elements'
  10.times do
    @average_real += x.report { 100.times { |el| hash[el] = el } }.real
  end
  puts "Average 'real' : #{@average_real / 10}"

  @average_real = 0
  puts 'Creating and writing values in a my_hash of 100 elements'
  10.times do
    @average_real += x.report { 100.times { |el| my_hash[el] = el } }.real
  end
  puts "Average 'real' : #{@average_real / 10}"

  @average_real = 0
  puts 'Reading values from a hash of 100 elements '
  10.times do
    @average_real += x.report { 100.times { |el| hash[el] } }.real
  end
  puts "Average 'real' : #{@average_real / 10}"

  @average_real = 0
  puts 'Reading values from a my_hash of 100 elements '
  10.times do
    @average_real += x.report { 100.times { |el| my_hash[el] } }.real
  end
  puts "Average 'real' : #{@average_real / 10}"

  puts 'Creating and writing values in a hash of 10000 elements'
  10.times do
    @average_real += x.report { 10_000.times { |el| hash[el] = el } }.real
  end
  puts "Average 'real' : #{@average_real / 10}"

  @average_real = 0
  puts 'Creating and writing values in a my_hash of 10000 elements'
  10.times do
    @average_real += x.report { 10_000.times { |el| my_hash[el] = el } }.real
  end
  puts "Average 'real' : #{@average_real / 10}"

  @average_real = 0
  puts 'Reading values from a hash of 10000 elements '
  10.times do
    @average_real += x.report { 10_000.times { |el| hash[el] } }.real
  end
  puts "Average 'real' : #{@average_real / 10}"

  @average_real = 0
  puts 'Reading values from a my_hash of 10000 elements '
  10.times do
    @average_real += x.report { 10_000.times { |el| my_hash[el] } }.real
  end
  puts "Average 'real' : #{@average_real / 10}"
end
# rubocop:enable Metrics/BlockLength
