# frozen_string_literal: true

require 'benchmark'
load 'my_array_rotate.rb'
Benchmark.bm do |x|
  x.report('lab rotate') { (1..1000).to_a.lab_rotate(10) }
  x.report('arr rotate') { (1..1000).to_a.rotate(10) }
  x.report('lab rotate') { (1..1000).to_a.lab_rotate(30) }
  x.report('arr rotate') { (1..1000).to_a.rotate(30) }
  x.report('lab rotate') { (1..1000).to_a.lab_rotate(70) }
  x.report('arr rotate') { (1..1000).to_a.rotate(70) }
  x.report('lab rotate') { (1..10_000).to_a.lab_rotate(1200) }
  x.report('arr rotate') { (1..10_000).to_a.rotate(1200) }
  x.report('lab rotate') { (1..10_000).to_a.lab_rotate(2400) }
  x.report('arr rotate') { (1..10_000).to_a.rotate(2400) }
  x.report('lab rotate') { (1..10_000).to_a.lab_rotate(3800) }
  x.report('arr rotate') { (1..10_000).to_a.rotate(3800) }
end
