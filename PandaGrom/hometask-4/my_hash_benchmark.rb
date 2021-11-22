# frozen_string_literal: true

require 'benchmark'
require './my_hash'

Benchmark.bm do |x|
  puts 'MyHash'
  my_hash = MyHash.new
  x.report('1_000       ') { 1_000.times { |value| my_hash[value] = value } }
  x.report('read(100)   ') { my_hash[100] }
  x.report('delete      ') { my_hash.delete_all }
  x.report('length      ') { my_hash.size }
  puts 'Hash'
  hash = {}
  x.report('1_000       ') { 1_000.times { |value| hash[value] = value } }
  x.report('read(100)   ') { hash[100] }
  x.report('clear       ') { hash.clear }
  x.report('length      ') { hash.length }
end
