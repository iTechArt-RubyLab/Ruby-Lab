# frozen_string_literal: true

require 'benchmark'
require_relative './my_array_rotate'

Benchmark.bm do |x|
  array100 = (1..100).to_a
  array10000 = (1..10_000).to_a
  array1000000 = (1..1_000_000).to_a
  puts 'Lab rotate'
  x.report { array100.lab_rotate(50) }
  x.report { array10000.lab_rotate(5000) }
  x.report { array1000000.lab_rotate(500_000) }

  puts 'Rotate'
  x.report { array100.rotate(50) }
  x.report { array10000.rotate(5000) }
  x.report { array1000000.rotate(500_000) }

  puts 'Lab rotate!'
  x.report { array100.lab_rotate!(50) }
  x.report { array10000.lab_rotate!(5000) }
  x.report { array1000000.lab_rotate!(500_000) }

  puts 'Rotate!'
  x.report { array100.rotate!(50) }
  x.report { array10000.rotate!(5000) }
  x.report { array1000000.rotate!(500_000) }
end
