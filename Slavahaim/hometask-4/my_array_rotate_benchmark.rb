#!/usr/bin/env ruby
# frozen_string_literal: true

require 'benchmark'
require './my_array_rotate'

Benchmark.bm do |x|
  puts '100'
  x.report('custom') { (1..100).to_a.lab_rotate(10) }
  x.report('native') { (1..100).to_a.rotate(10) }
  x.report('custom') { (1..100).to_a.lab_rotate(99) }
  x.report('native') { (1..100).to_a.rotate(99) }
  x.report('custom') { (1..100).to_a.lab_rotate(232) }
  x.report('native') { (1..100).to_a.rotate(232) }
  puts '1000'
  x.report('custom') { (1..1000).to_a.lab_rotate!(10) }
  x.report('native') { (1..1000).to_a.rotate!(10) }
  x.report('custom') { (1..1000).to_a.lab_rotate!(99) }
  x.report('native') { (1..1000).to_a.rotate!(99) }
  x.report('custom') { (1..1000).to_a.lab_rotate!(232) }
  x.report('native') { (1..1000).to_a.rotate!(232) }
end
