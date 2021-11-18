# frozen_string_literal: true

require_relative 'my_array_rotate'
require 'benchmark'

Benchmark.bm do |x|
  puts '100'
  x.report { (1..100).to_a.lab_rotate(10) }
  x.report { (1..100).to_a.rotate(10) }

  x.report { (1..100).to_a.lab_rotate(99) }
  x.report { (1..100).to_a.rotate(99) }

  x.report { (1..100).to_a.lab_rotate(232) }
  x.report { (1..100).to_a.rotate(232) }
  puts '1000'
  x.report { (1..1000).to_a.lab_rotate(10) }
  x.report { (1..1000).to_a.rotate(10) }

  x.report { (1..1000).to_a.lab_rotate(99) }
  x.report { (1..1000).to_a.rotate(99) }

  x.report { (1..1000).to_a.lab_rotate(232) }
  x.report { (1..1000).to_a.rotate(232) }
end
