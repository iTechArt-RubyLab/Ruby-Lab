# !/usr/bin/env ruby
# frozen_string_literal: true

require 'benchmark'
require './model/my_array_rotate'

# Array benchmark
class ArrayBenchmark
  include Benchmark
  ROTATE_QTY = 500_000_000
  MIN_ARRAY_ELEMENT_VALUE = 1
  MAX_ARRAY_ELEMENT_VALUE = 100_000_000

  def array_rotate_benchmark
    array = (MIN_ARRAY_ELEMENT_VALUE..MAX_ARRAY_ELEMENT_VALUE).to_a
    Benchmark.benchmark(CAPTION, 15, FORMAT) do |rotate|
      rotate.report('Andrew P rotate: ') { array.lab_rotate!(ROTATE_QTY) }
      rotate.report('Built-in rotate: ') { array.rotate!(ROTATE_QTY) }
    end
  end
end

ArrayBenchmark.new.array_rotate_benchmark
