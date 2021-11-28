# frozen_string_literal: true

require 'benchmark'
require_relative './my_hash'

@my_hash = MyHash.new
@hash = {}

Benchmark.bm do |x|
  puts 'MyHash'
  x.report('10') { 10.times { |i| @my_hash[i] = i } }
  x.report('100') { 100.times { |i| @my_hash[i] = i } }
  x.report('1000') { 1000.times { |i| @my_hash[i] = i } }
  x.report('10000') { 10_000.times { |i| @my_hash[i] = i } }
  x.report('read(100)') { @my_hash[100] }
  x.report('delete') { @my_hash.delete(100) }
  x.report('delete_all') { @my_hash.delete_all }
  x.report('length') { @my_hash.length }
  puts 'Hash'
  x.report('10') { 10.times { |i| @hash[i] = i } }
  x.report('100') { 100.times { |i| @hash[i] = i } }
  x.report('1000') { 1000.times { |i| @hash[i] = i } }
  x.report('10000') { 10_000.times { |i| @hash[i] = i } }
  x.report('read(100)') { hash[100] }
  x.report('delete') { @hash.delete(100) }
  x.report('delete_all'){@hash.clear}
  x.report('length') { @hash.length }
end
