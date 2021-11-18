# !/usr/bin/env ruby
# frozen_string_literal: true

require 'benchmark'
require './model/my_hash.rb'

# Hash benchmark
class HashBenchmark
  include Benchmark
  ELEMENTS_COUNT = 250

  def hash_operations_benchmark
    hash = {}
    my_hash = MyHash.new
    Benchmark.benchmark(CAPTION, 20, FORMAT) do |operation|
      operation.report('Ruby hash elements add: ') { ELEMENTS_COUNT.times { |counter| hash[counter] = counter } }
      operation.report('My hash elements add: ') { ELEMENTS_COUNT.times { |counter| my_hash[counter] = counter } }
      operation.report('Ruby hash clear: ') { hash.clear }
      operation.report('My hash clear: ') { my_hash.clear }
    end
  end
end

HashBenchmark.new.hash_operations_benchmark
