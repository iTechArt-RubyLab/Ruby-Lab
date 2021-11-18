# frozen_string_literal: true

require 'benchmark'
require_relative 'my_array_rotate'

Benchmark.bm do |x|
  puts 'Lab_rotate! Array size are 10 items'
  x.report { (1..10).to_a.lab_rotate!(4) }
  x.report { (1..10).to_a.lab_rotate!(7) }

  puts 'rotate! Array size are 10 items'
  x.report { (1..10).to_a.rotate!(4) }
  x.report { (1..10).to_a.rotate!(7) }
  

  puts 'Lab_rotate! Array size are 1000 items'
  x.report { (1..1000).to_a.lab_rotate!(25) }
  x.report { (1..1000).to_a.lab_rotate!(99) }
  puts 'rotate! Array size are 1000 items'
  x.report { (1..1000).to_a.rotate!(25) }
  x.report { (1..1000).to_a.rotate!(99) }
  

  puts 'Lab_rotate! Array size are 10 items'
  x.report { (1..10).to_a.lab_rotate(4) }
  x.report { (1..10).to_a.lab_rotate(7) }
  puts 'rotate! Array size are 10 items'
  x.report { (1..10).to_a.rotate(4) }
  x.report { (1..10).to_a.rotate(7) }
  

  puts 'Lab_rotate! Array size are 1000 items'
  x.report { (1..1000).to_a.lab_rotate(10) }
  x.report { (1..1000).to_a.lab_rotate(99) }
  puts 'rotate! Array size are 1000 items'
  x.report { (1..1000).to_a.rotate(10) }
  x.report { (1..1000).to_a.rotate(99) }
  
end
