# frozen_string_literal: true

require 'benchmark'
require './hash3'

Benchmark.bm do |x|
  hash = {}
  my_hash = MyHash.new
  puts '100'
  x.report { 100.times { |el| hash[el] = el } }
  x.report { 100.times { |el| my_hash[el] = el } }
  my_hash.clear
  puts '1000'
  x.report { 1000.times { |el| hash[el] = el } }
  x.report { 1000.times { |el| my_hash[el] = el } }
  my_hash.clear
  puts '1_000_000'
  x.report { 1_000_000.times { |el| hash[el] = el } }
  x.report { 1_000_000.times { |el| my_hash[el] = el } }
  my_hash.clear
  puts 'read'
  puts '100'
  x.report { hash[100] }
  x.report { my_hash[100] }
  puts '1000'
  x.report { hash[1000] }
  x.report { my_hash[1000] }
  puts '100000'
  x.report { hash[1_000_000] }
  x.report { my_hash[1_000_000] }
end
