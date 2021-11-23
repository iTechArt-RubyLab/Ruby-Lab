# frozen_string_literal: true

require_relative 'my_array_rotate'
require 'benchmark'

Benchmark.bm do |n|
  puts 'Test for an array of 10 elements'
  puts 'lab_rotate:'
  n.report { (1..10).to_a.lab_rotate(5) }
  puts 'rotate:'
  n.report { (1..10).to_a.rotate(5) }
  puts 'lab_rotate:'
  n.report { (1..10).to_a.lab_rotate(315) }
  puts 'rotate:'
  n.report { (1..10).to_a.rotate(315) }

  puts 'Test for an array of 1000 elements'
  puts 'lab_rotate:'
  n.report { (1..1000).to_a.lab_rotate(5) }
  puts 'rotate:'
  n.report { (1..1000).to_a.rotate(5) }
  puts 'lab_rotate:'
  n.report { (1..1000).to_a.lab_rotate(315) }
  puts 'rotate:'
  n.report { (1..1000).to_a.rotate(315) }
end
