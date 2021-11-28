# frozen_string_literal: true

require 'benchmark'
require_relative 'my_hash'

Benchmark.bm do |x|
  puts 'MyHash'
  my_hash = MyHash.new
  x.report('add 1000: ') { 1_000.times { |value| my_hash[value] = value } }
  x.report('get 100: ') { my_hash[100] }
  x.report('clean hash: ') { my_hash.clean }
  x.report('length: ') { my_hash.count }
  puts 'Hash'
  hash = {}
  x.report('add 1000: ') { 1_000.times { |value| hash[value] = value } }
  x.report('get 100: ') { hash[100] }
  x.report('clean hash: ') { hash.clear }
  x.report('length: ') { hash.length }
end
