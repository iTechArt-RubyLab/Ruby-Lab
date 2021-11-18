# frozen_string_literal: true

require 'benchmark'
require './my_hash'

Benchmark.bm do |x|
  puts 'Hash'
  hash = {}
  x.report { 100.times { |el| hash[el] = el } }
  hash.clear
  x.report { 1000.times { |el| hash[el] = el } }
  hash.clear

  puts 'write MyHash'
  my_hash = MyHash.new
  x.report { 100.times { |el| my_hash[el] = el } }
  my_hash.clear
  x.report { 1000.times { |el| my_hash[el] = el } }
  my_hash.clear

  puts 'read Hash'
  x.report { hash[99] }
  x.report { hash[999] }

  puts 'read MyHash'
  x.report { my_hash[99] }
  x.report { my_hash[999] }
end
