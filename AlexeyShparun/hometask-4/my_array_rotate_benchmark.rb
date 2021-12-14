# frozen_string_literal: true

require 'benchmark'
require_relative 'array'

Benchmark.bm do |x|
  puts 'Lab_rotate Array size are 10 items'
  x.report { (1..10).to_a.lab_rotate(5) }
  x.report { (1..10).to_a.lab_rotate(9) }
  puts 'lab_rotate! Array size are 10 items'
  x.report { (1..10).to_a.lab_rotate!(5) }
  x.report { (1..10).to_a.lab_rotate!(9) }
  puts 'Lab_rotate Array size are 1000 items'
  x.report { (1..1000).to_a.lab_rotate(23) }
  x.report { (1..1000).to_a.lab_rotate(89) }
  puts 'lab_rotate! Array size are 1000 items'
  x.report { (1..1000).to_a.lab_rotate!(23) }
  x.report { (1..1000).to_a.lab_rotate!(89) }
end
