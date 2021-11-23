#!/usr/bin/env ruby

# frozen_string_literal: true

require 'benchmark'
require './my_array_rotate'

h = 100
t = 1000
ten_t = 10_000
p 'Comparison methods rotate and lab_rotate'
Benchmark.bm do |a|
  p 'Comarison on 100'
  a.report('my method') { (1..h).to_a.lab_rotate(10) }
  a.report('real method') { (1..h).to_a.rotate(10) }
  a.report('my method') { (1..h).to_a.lab_rotate(100) }
  a.report('real method') { (1..h).to_a.rotate(100) }
  a.report('my method') { (1..h).to_a.lab_rotate(200) }
  a.report('real method') { (1..h).to_a.rotate(200) }
  p 'Comarison on 1000'
  a.report('my method') { (1..t).to_a.lab_rotate(50) }
  a.report('real method') { (1..t).to_a.rotate(50) }
  a.report('my method') { (1..t).to_a.lab_rotate(150) }
  a.report('real method') { (1..t).to_a.rotate(150) }
  a.report('my method') { (1..t).to_a.lab_rotate(500) }
  a.report('real method') { (1..t).to_a.rotate(500) }
  p 'Comarison on 10_000'
  a.report('my method') { (1..ten_t).to_a.lab_rotate(100) }
  a.report('real method') { (1..ten_t).to_a.rotate(100) }
  a.report('my method') { (1..ten_t).to_a.lab_rotate(1000) }
  a.report('real method') { (1..ten_t).to_a.rotate(1000) }
  a.report('my method') { (1..ten_t).to_a.lab_rotate(10_000) }
  a.report('real method') { (1..ten_t).to_a.rotate(10_000) }
end
