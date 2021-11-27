# frozen_string_literal: true

require 'benchmark'
require_relative './my_array_rotate'

@size1 = (1..100).to_a
@size2 = (1..1000).to_a
@size3 = (1..1_000_000).to_a

Benchmark.bm do |x|
  puts '100'
  x.report('custom') { @size1.lab_rotate(3) }
  x.report('native') { @size1.rotate(3) }
  x.report('custom') { @size1.lab_rotate(100) }
  x.report('native') { @size1.rotate(100) }
  x.report('custom') { @size1.lab_rotate(185) }
  x.report('native') { @size1.rotate(185) }
  x.report('custom') { @size1.lab_rotate(-25) }
  x.report('native') { @size1.rotate(-25) }
  puts '1000'
  x.report('custom') { @size2.lab_rotate(6) }
  x.report('native') { @size2.rotate(6) }
  x.report('custom') { @size2.lab_rotate(1000) }
  x.report('native') { @size2.rotate(1000) }
  x.report('custom') { @size2.lab_rotate(1120) }
  x.report('native') { @size2.rotate(1120) }
  x.report('custom') { @size2.lab_rotate(-225) }
  x.report('native') { @size2.rotate(-225) }
  puts '1000000'
  x.report('custom') { @size3.lab_rotate(1_000_000) }
  x.report('native') { @size3.rotate(1_000_000) }
  x.report('custom') { @size3.lab_rotate(1_110_000) }
  x.report('native') { @size3.rotate(1_110_000) }
  x.report('custom') { @size3.lab_rotate(-225) }
  x.report('native') { @size3.rotate(-225) }
end
