# frozen_string_literal: true

require 'benchmark'
require './my_hash'

Benchmark.bm do |x|
  puts 'Hash: 100 and 1000 items'
  hash = {}
  x.report { 100.times { |el| hash[el] = el } }
  x.report { hash.delete(6) }
  x.report { hash.length }
  x.report { hash.clear }
  puts '1000 items'
  x.report { 1000.times { |el| hash[el] = el } }
  x.report { hash.delete(65) }
  x.report { hash.length }
  x.report { hash.clear }

  puts 'MyHash: 100 items'
  my_hash = MyHash.new
  x.report { 100.times { |el| my_hash[el] = el } }
  x.report { my_hash.delete(6) }
  x.report { my_hash.clear }
  x.report { my_hash.length }
  puts '1000 items'
  x.report { 1000.times { |el| my_hash[el] = el } }
  x.report { my_hash.delete(65) }
  x.report { my_hash.clear }
  x.report { my_hash.length }
end
