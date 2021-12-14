# frozen_string_literal: true

require 'benchmark'
require_relative 'my_lab_rotate'

Benchmark.bm do |x|
  puts '10 elements of array'
  first_value = (1..10).to_a

  puts 'My rotate'
  x.report { first_value.lab_rotate(2) }
  x.report { first_value.lab_rotate!(7) }

  puts 'Class Array rotate'
  x.report { first_value.rotate(2) }
  x.report { first_value.rotate!(7) }

  puts '100 elements of array'
  second_value = (1..100).to_a

  puts 'My rotate'
  x.report { second_value.lab_rotate(30) }
  x.report { second_value.lab_rotate!(-43) }

  puts 'Class Array rotate'
  x.report { second_value.rotate(30) }
  x.report { second_value.rotate!(-43) }

  puts '1000 elements of array'
  third_value = (1..1000).to_a

  puts 'My rotate'
  x.report { third_value.lab_rotate(228) }
  x.report { third_value.lab_rotate!(703) }

  puts 'Class Array rotate'
  x.report { third_value.to_a.rotate(228) }
  x.report { third_value.rotate!(703) }
end
