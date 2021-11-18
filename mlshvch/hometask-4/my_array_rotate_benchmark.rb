#!/usr/bin/env ruby

# frozen_string_literal: true

require 'benchmark'
require './my_array_rotate'

EXIT_MESSAGE = 'exit!'

def run_benchmark(shift)
  array = (1..100_000).map { rand * 100 }
  Benchmark.bm(7) do |x|
    x.report('rotate:') { array.rotate(shift) }
    x.report('lab_rotate:') { array.lab_rotate(shift) }
    x.report('rotate!:') { array.rotate!(shift) }
    x.report('lab_rotate!') { array.lab_rotate!(shift) }
  end
end

def run_cli
  loop do
    print 'Enter number of elements to be shifted: '
    shift = gets.chomp
    break if shift == EXIT_MESSAGE

    run_benchmark(shift.to_i)
  end
end

run_cli
