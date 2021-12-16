# frozen_string_literal: true

require 'benchmark'
require_relative 'my_array_rotate'

Benchmark.bm do |x|
  puts '1000 elements in array'
  x.report('lab_rotate') { (1..1000).to_a.lab_rotate(99) }
  x.report('rotate') { (1..1000).to_a.rotate(99) }
  x.report('lab_rotate!') { (1..1000).to_a.lab_rotate!(999) }
  x.report('rotate!') { (1..1000).to_a.rotate!(999) }
  puts '1000000 elements in array'
  x.report('lab_rotate') { (1..1_000_000).to_a.lab_rotate(999) }
  x.report('rotate') { (1..1_000_000).to_a.rotate(999) }
  x.report('lab_rotate!') { (1..1_000_000).to_a.lab_rotate!(-999_999) }
  x.report('rotate!') { (1..1_000_000).to_a.rotate!(-999_999) }
end
