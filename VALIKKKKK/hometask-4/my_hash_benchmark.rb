# frozen_string_literal: true

require 'benchmark'
require_relative 'my_hash'

Benchmark.bm do |x|
  puts 'MyHash'
  my_hash = MyHash.new
  x.report('1_000 elements fill') { 1_000.times { |value| my_hash[value] = value } }
  x.report('read 100 elements') { my_hash[100] }
  x.report('delete by key') { my_hash.delete_by_key(100) }
  x.report('delete all') { my_hash.delete_all }
  x.report('length') { my_hash.size }
  puts 'Hash'
  hash = {}
  x.report('1_000 elements fill') { 1_000.times { |value| hash[value] = value } }
  x.report('read 100 elements') { hash[100] }
  x.report('delete by key') { hash.delete(100) }
  x.report('clear') { hash.clear }
  x.report('length') { hash.length }
end
