# !/usr/bin/env ruby
# frozen_string_literal: true

require 'benchmark'
require './my_array_rotate'

Benchmark.bm do |x|
  puts 'Just rotate'
  puts '<<<<<Size: 100>>>>>'
  puts '30'
  x.report('native') { (1..100).to_a.rotate(30) }
  x.report('custom') { (1..100).to_a.lab_rotate(30) }
  puts '10_000'
  x.report('native') { (1..100).to_a.rotate(10_000) }
  x.report('custom') { (1..100).to_a.lab_rotate(10_000) }
  puts '-10_000'
  x.report('native') { (1..100).to_a.rotate(-10_000) }
  x.report('custom') { (1..100).to_a.lab_rotate(-10_000) }
  puts '<<<<<Size: 10_000>>>>>'
  puts '3333'
  x.report('native') { (1..10_000).to_a.rotate(3333) }
  x.report('custom') { (1..10_000).to_a.lab_rotate(3333) }
  puts '-3333'
  x.report('native') { (1..10_000).to_a.rotate(-3333) }
  x.report('custom') { (1..10_000).to_a.lab_rotate(-3333) }
  puts '<<<<<Size: 1_000_000>>>>>'
  puts '5000'
  x.report('native') { (1..1_000_000).to_a.rotate(5000) }
  x.report('custom') { (1..1_000_000).to_a.lab_rotate(5000) }
  puts '-5000'
  x.report('native') { (1..1_000_000).to_a.rotate(-5000) }
  x.report('custom') { (1..1_000_000).to_a.lab_rotate(-5000) }
end

Benchmark.bm do |x|
  puts 'rotate!'
  puts '<<<<<Size: 100>>>>>'
  puts '30'
  x.report('native') { (1..100).to_a.rotate!(30) }
  x.report('custom') { (1..100).to_a.lab_rotate!(30) }
  puts '10_000'
  x.report('native') { (1..100).to_a.rotate!(10_000) }
  x.report('custom') { (1..100).to_a.lab_rotate!(10_000) }
  puts '-10_000'
  x.report('native') { (1..100).to_a.rotate!(-10_000) }
  x.report('custom') { (1..100).to_a.lab_rotate!(-10_000) }
  puts '<<<<<Size: 10_000>>>>>'
  puts '3333'
  x.report('native') { (1..10_000).to_a.rotate!(3333) }
  x.report('custom') { (1..10_000).to_a.lab_rotate!(3333) }
  puts '-3333'
  x.report('native') { (1..10_000).to_a.rotate!(-3333) }
  x.report('custom') { (1..10_000).to_a.lab_rotate!(-3333) }
  puts '<<<<<Size: 1_000_000>>>>>'
  puts '5000'
  x.report('native') { (1..1_000_000).to_a.rotate!(5000) }
  x.report('custom') { (1..1_000_000).to_a.lab_rotate!(5000) }
  puts '-5000'
  x.report('native') { (1..1_000_000).to_a.rotate!(-5000) }
  x.report('custom') { (1..1_000_000).to_a.lab_rotate!(-5000) }
end
