# frozen_string_literal: true

require 'benchmark'
require_relative 'my_array_rotate'

Benchmark.bm do |n|
  puts 'comparing lab_rotate and rotate by 100'
  n.report('my') { (1..100).to_a.lab_rotate(37) }
  n.report('native') { (1..100).to_a.rotate(37) }
  n.report('my') { (1..100).to_a.lab_rotate(100) }
  n.report('native') { (1..100).to_a.rotate(100) }
  n.report('my') { (1..100).to_a.lab_rotate(190) }
  n.report('native') { (1..100).to_a.rotate(190) }

  puts 'comparing lab_rotate and rotate by 1_000'
  n.report('my') { (1..1_000).to_a.lab_rotate(11) }
  n.report('native') { (1..1_000).to_a.rotate(11) }
  n.report('my') { (1..1_000).to_a.lab_rotate(120) }
  n.report('native') { (1..1_000).to_a.rotate(120) }
  n.report('my') { (1..1_000).to_a.lab_rotate(-135) }
  n.report('native') { (1..1_000).to_a.rotate(-135) }

  puts 'comparing lab_rotate and rotate by 1_000_000'
  n.report('my') { (1..1_000_000).to_a.lab_rotate(9) }
  n.report('native') { (1..1_000_000).to_a.rotate(9) }
  n.report('my') { (1..1_000_000).to_a.lab_rotate(199) }
  n.report('native') { (1..1_000_000).to_a.rotate(199) }
  n.report('my') { (1..1_000_000).to_a.lab_rotate(735_735) }
  n.report('native') { (1..1_000_000).to_a.rotate(735_735) }
end
