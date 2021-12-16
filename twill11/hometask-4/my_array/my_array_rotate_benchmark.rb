# frozen_string_literal: true

require 'benchmark'
require_relative 'class_array'

Benchmark.bm do |x|
  puts '100_000'
  x.report('lab_rotate:') { (1..100_000).to_a.lab_rotate(99_483) }
  x.report('lab_rotate!:') { (1..100_000).to_a.lab_rotate!(99_879) }
  x.report('rotate:') { (1..100_000).to_a.rotate(99_483) }
  x.report('rotate!:') { (1..100_000).to_a.rotate!(99_879) }

  puts '1_000_000'
  x.report('lab_rotate:') { (1..1_000_000).to_a.lab_rotate(203_454) }
  x.report('lab_rotate!:') { (1..1_000_000).to_a.lab_rotate!(920_232) }
  x.report('rotate:') { (1..1_000_000).to_a.rotate(203_454) }
  x.report('rotate!:') { (1..1_000_000).to_a.rotate!(920_232) }

  puts '10_000_000'
  x.report('lab_rotate:') { (1..10_000_000).to_a.lab_rotate(7_332_564) }
  x.report('lab_rotate!:') { (1..10_000_000).to_a.lab_rotate!(9_293_740) }
  x.report('rotate:') { (1..10_000_000).to_a.rotate(7_332_564) }
  x.report('rotate!:') { (1..10_000_000).to_a.rotate!(9_293_740) }
end
