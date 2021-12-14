# frozen_string_literal: true

require 'benchmark'
load 'my_hash.rb'
Benchmark.bm do |x|
  my_hash = MyHash.new
  hash = {}
  p 'My hash'
  x.report { 1_000_000.times { |iterator| my_hash[iterator] = iterator } }
  x.report { my_hash[50] }
  x.report { my_hash.length }
  x.report { my_hash.clear }

  p 'Hash'
  x.report { 1_000_000.times { |iterator| hash[iterator] = iterator } }
  x.report { hash[50] }
  x.report { hash.length }
  x.report { hash.clear }
end
