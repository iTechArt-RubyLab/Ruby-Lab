#!/usr/bin/env ruby
# frozen_string_literal: true

require 'benchmark'
require './my_array_rotate'

Benchmark.bm do |x|
  p 'my lab_rotate'
  x.report { (1..100).to_a.lab_rotate(10) }
  x.report { (1..100).to_a.lab_rotate(10) }
  x.report { (1..100).to_a.lab_rotate(10) }
  x.report { (1..100).to_a.lab_rotate(10) }
  x.report { (1..100).to_a.lab_rotate(10) }

  p 'rotate'
  x.report { (1..100).to_a.rotate(10) }
  x.report { (1..100).to_a.rotate(10) }
  x.report { (1..100).to_a.rotate(10) }
  x.report { (1..100).to_a.rotate(10) }
  x.report { (1..100).to_a.rotate(10) }
end
