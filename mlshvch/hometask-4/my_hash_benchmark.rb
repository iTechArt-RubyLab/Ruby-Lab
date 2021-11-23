#!/usr/bin/env ruby

# frozen_string_literal: true

require 'benchmark'
require './my_hash'

Benchmark.bm(12) do |x|
  lab_hash = MyHash.new
  hash = {}
  10.times do |index|
    lab_hash[index] = rand
    hash[index] = rand
  end
  puts '10 elements:'
  x.report('MyHash write') { lab_hash['a1'] = rand }
  x.report('Hash write') { hash['a1'] = rand }
  x.report('MyHash read') { lab_hash['a1'] }
  x.report('Hash read') { hash['a1'] }
  x.report('MyHash delete') { lab_hash.delete('a1') }
  x.report('Hash delete') { hash.delete('a1') }
end

Benchmark.bm(12) do |x|
  lab_hash = MyHash.new
  hash = {}
  1_000.times do |index|
    lab_hash[index] = rand
    hash[index] = rand
  end
  puts '1_000 elements:'
  x.report('MyHash write') { lab_hash['a1'] = rand }
  x.report('Hash write') { hash['a1'] = rand }
  x.report('MyHash read') { lab_hash['a1'] }
  x.report('Hash read') { hash['a1'] }
  x.report('MyHash delete') { lab_hash.delete('a1') }
  x.report('Hash delete') { hash.delete('a1') }
end

Benchmark.bm(12) do |x|
  lab_hash = MyHash.new
  hash = {}
  1_000_000.times do |index|
    lab_hash[index] = rand
    hash[index] = rand
  end
  puts '1_000_000 elements:'
  x.report('MyHash write') { lab_hash['a1'] = rand }
  x.report('Hash write') { hash['a1'] = rand }
  x.report('MyHash read') { lab_hash['a1'] }
  x.report('Hash read') { hash['a1'] }
  x.report('MyHash delete') { lab_hash.delete('a1') }
  x.report('Hash delete') { hash.delete('a1') }
end
