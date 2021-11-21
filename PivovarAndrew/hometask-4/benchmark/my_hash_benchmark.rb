# !/usr/bin/env ruby
# frozen_string_literal: true

require 'benchmark'
require './model/my_hash'

# Hash benchmark
class HashBenchmark
  include Benchmark
  ELEMENTS_COUNT = 200_000

  def hash_operations_benchmark
    hash = {}
    my_hash = MyHash.new
    Benchmark.benchmark(CAPTION, 20, FORMAT) do |operation|
      operation.report('Ruby hash elements add: ') { ELEMENTS_COUNT.times { |counter| hash[counter] = counter } }
      operation.report('My hash elements add: ') { ELEMENTS_COUNT.times { |counter| my_hash[counter] = counter } }
      operation.report('Ruby hash read: ') { hash[ELEMENTS_COUNT - 10] }
      operation.report('My hash read: ') { my_hash[ELEMENTS_COUNT - 10] }
    end
  end
end

HashBenchmark.new.hash_operations_benchmark
