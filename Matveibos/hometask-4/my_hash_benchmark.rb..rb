# frozen_string_literal: true

require 'benchmark'
require './my_hash'

puts '100'

Benchmark.bm do |x|
  hash = {}
  my_hash = MyHash.new
  puts '100'
  x.report { 100.times { |el, al| hash[el] = al } }
  x.report { 100.times { |el, al| my_hash[el] = al } }
  puts '1000'
  x.report { 1000.times { |el| hash[el] = el } }
  x.report { 1000.times { |el| my_hash[el] = el } }
  puts '10000'
  x.report { 10_000.times { |el| hash[el] = el } }
  x.report { 10_000.times { |el| my_hash[el] = el } }
  puts 'read'
  puts '100'
  x.report { hash[100] }
  x.report { my_hash[100] }
  puts '1000'
  x.report { hash[1000] }
  x.report { my_hash[1000] }
  puts '100000'
  x.report { hash[100_000] }
  x.report { my_hash[100_000] }
end
