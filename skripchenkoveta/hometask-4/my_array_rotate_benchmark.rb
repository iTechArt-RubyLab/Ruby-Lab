# frozen_string_literal: true

require 'benchmark'
require './my_array_rotate'

# rubocop:disable Metrics/BlockLength
Benchmark.bm do |x|
  @average_real = 0
  puts 'rotate for an array of 10 elements'
  10.times do
    @average_real += x.report { (1..10).to_a.rotate(4) }.real
  end
  puts "Average 'real' : #{@average_real / 10}"

  @average_real = 0
  puts 'lab_rotate for an array of 10 elements'
  10.times do
    @average_real += x.report { (1..10).to_a.lab_rotate(4) }.real
  end
  puts "Average 'real' : #{@average_real / 10}"

  @average_real = 0
  puts 'rotate! for an array of 10 elements'
  10.times do
    @average_real += x.report { (1..10).to_a.rotate!(4) }.real
  end
  puts "Average 'real' : #{@average_real / 10}"

  @average_real = 0
  puts 'lab_rotate! for an array of 10 elements'
  10.times do
    @average_real += x.report { (1..10).to_a.lab_rotate!(4) }.real
  end
  puts "Average 'real' : #{@average_real / 10}"

  @average_real = 0
  puts 'rotate for an array of 10000 elements'
  10.times do
    @average_real += x.report { (1..10_000).to_a.rotate(500) }.real
  end
  puts "Average 'real' : #{@average_real / 10}"

  @average_real = 0
  puts 'lab_rotate for an array of 10000 elements'
  10.times do
    @average_real += x.report { (1..10_000).to_a.lab_rotate(500) }.real
  end
  puts "Average 'real' : #{@average_real / 10}"

  @average_real = 0
  puts 'rotate! for an array of 10000 elements'
  10.times do
    @average_real += x.report { (1..10_000).to_a.rotate!(500) }.real
  end
  puts "Average 'real' : #{@average_real / 10}"

  @average_real = 0
  puts 'lab_rotate! for an array of 10000 elements'
  10.times do
    @average_real += x.report { (1..10_000).to_a.lab_rotate!(500) }.real
  end
  puts "Average 'real' : #{@average_real / 10}"
end
# rubocop:enable Metrics/BlockLength
