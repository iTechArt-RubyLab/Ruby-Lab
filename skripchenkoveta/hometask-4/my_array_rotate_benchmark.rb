# frozen_string_literal: true

require 'benchmark'
require './my_array_rotate'

Benchmark.bm do |x|
  puts 'Tests for rotate!/lab_rotate! Array size are 10 items'
  x.report { (1..10).to_a.rotate!(4) }
  x.report { (1..10).to_a.rotate!(7) }
  x.report { (1..10).to_a.lab_rotate!(4) }
  x.report { (1..10).to_a.lab_rotate!(7) }

  puts 'Tests for rotate!/lab_rotate! Array size are 100 items'
  x.report { (1..100).to_a.rotate!(25) }
  x.report { (1..100).to_a.rotate!(99) }
  x.report { (1..100).to_a.lab_rotate!(25) }
  x.report { (1..100).to_a.lab_rotate!(99) }

  puts 'Tests for rotate/lab_rotate! Array size are 10 items'
  x.report { (1..10).to_a.rotate(4) }
  x.report { (1..10).to_a.rotate(7) }
  x.report { (1..10).to_a.lab_rotate(4) }
  x.report { (1..10).to_a.lab_rotate(7) }
  puts 'Tests for rotate!/lab_rotate! Array size are 100 items'

  x.report { (1..100).to_a.rotate(10) }
  x.report { (1..100).to_a.rotate(99) }
  x.report { (1..100).to_a.lab_rotate(10) }
  x.report { (1..100).to_a.lab_rotate(99) }
end
