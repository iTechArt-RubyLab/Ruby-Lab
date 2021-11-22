#!/usr/bin/env ruby

# frozen_string_literal: true

require 'benchmark'
require './my_array_rotate'

puts "\nBenchmarking with 100-element array"
Benchmark.bm(12) do |x|
  x.report('rotate:') { (1..100).to_a.rotate(16) }
  x.report('lab_rotate:') { (1..100).to_a.lab_rotate(16) }
  x.report('rotate:') { (1..100).to_a.rotate(-64) }
  x.report('lab_rotate:') { (1..100).to_a.lab_rotate(-64) }
  x.report('rotate:') { (1..100).to_a.rotate(128) }
  x.report('lab_rotate:') { (1..100).to_a.lab_rotate(128) }

  puts "\n"

  x.report('rotate!:') { (1..100).to_a.rotate!(10) }
  x.report('lab_rotate!:') { (1..100).to_a.lab_rotate!(10) }
  x.report('rotate!:') { (1..100).to_a.rotate!(-64) }
  x.report('lab_rotate!:') { (1..100).to_a.lab_rotate!(-64) }
  x.report('rotate!:') { (1..100).to_a.rotate!(128) }
  x.report('lab_rotate!:') { (1..100).to_a.lab_rotate!(128) }
end

puts "\nBenchmarking with 10_000-element array"
Benchmark.bm(12) do |x|
  x.report('rotate:') { (1..10_000).to_a.rotate(16) }
  x.report('lab_rotate:') { (1..10_000).to_a.lab_rotate(16) }
  x.report('rotate:') { (1..10_000).to_a.rotate(-64) }
  x.report('lab_rotate:') { (1..10_000).to_a.lab_rotate(-64) }
  x.report('rotate:') { (1..10_000).to_a.rotate(16_384) }
  x.report('lab_rotate:') { (1..10_000).to_a.lab_rotate(16_384) }

  puts "\n"

  x.report('rotate!:') { (1..10_000).to_a.rotate!(-16) }
  x.report('lab_rotate!:') { (1..100).to_a.lab_rotate!(-16) }
  x.report('rotate!:') { (1..100).to_a.rotate!(-64) }
  x.report('lab_rotate!:') { (1..100).to_a.lab_rotate!(-64) }
  x.report('rotate!:') { (1..100).to_a.rotate!(16_384) }
  x.report('lab_rotate!:') { (1..100).to_a.lab_rotate!(16_384) }
end

puts "\nBenchmarking with 1_000_000-element array"
Benchmark.bm(12) do |x|
  x.report('rotate:') { (1..1_000_000).to_a.rotate(16) }
  x.report('lab_rotate:') { (1..1_000_000).to_a.lab_rotate(16) }
  x.report('rotate:') { (1..1_000_000).to_a.rotate(-64) }
  x.report('lab_rotate:') { (1..1_000_000).to_a.lab_rotate(-64) }
  x.report('rotate:') { (1..1_000_000).to_a.rotate(999_998) }
  x.report('lab_rotate:') { (1..1_000_000).to_a.lab_rotate(999_998) }

  puts "\n"

  x.report('rotate!:') { (1..1_000_000).to_a.rotate!(16) }
  x.report('lab_rotate!:') { (1..1_000_000).to_a.lab_rotate!(16) }
  x.report('rotate!:') { (1..1_000_000).to_a.rotate!(-64) }
  x.report('lab_rotate!:') { (1..1_000_000).to_a.lab_rotate!(-64) }
  x.report('rotate!:') { (1..1_000_000).to_a.rotate!(999_998) }
  x.report('lab_rotate!:') { (1..1_000_000).to_a.lab_rotate!(999_998) }
end
