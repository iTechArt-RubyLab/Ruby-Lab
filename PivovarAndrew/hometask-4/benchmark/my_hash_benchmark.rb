# !/usr/bin/env ruby
# frozen_string_literal: true

require 'benchmark'
require './model/my_hash'

# Hash benchmark
class HashBenchmark
  include Benchmark
  ELEMENTS_COUNT = 3_000
  BENCHMARKS_COUNT = 1

  def hash_operations_benchmark
    hash = {}
    my_hash = MyHash.new
    BENCHMARKS_COUNT.times do |_benchmarks_counter|
      Benchmark.benchmark(CAPTION, 20, FORMAT) do |operation|
        operation.report('Ruby hash elements add: ') { hash_elements_add(hash) }
        operation.report('My hash elements add: ') { hash_elements_add(my_hash) }
        operation.report('Ruby hash read: ') { hash[(ELEMENTS_COUNT - 10).to_s] }
        operation.report('My hash read: ') { my_hash[(ELEMENTS_COUNT - 10).to_s] }
      end
    end
  end

  private

  def hash_elements_add(hash)
    ELEMENTS_COUNT.times { |counter| hash[counter.to_s] = counter.to_s }
  end
end

HashBenchmark.new.hash_operations_benchmark
