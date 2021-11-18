#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'my_hash'
require 'benchmark'

Benchmark.bm do |x|
  hash = {}
  my_hash = MyHash.new

  puts 'Write'
  puts '100'
  x.report { 100.times { |el| hash[el] = el } }
  x.report { 100.times { |el| my_hash[el] = el } }
  hash.clear
  my_hash.clear_all

  puts '10_000'
  x.report { 10_000.times { |el| hash[el] = el } }
  x.report { 10_000.times { |el| my_hash[el] = el } }
  hash.clear
  my_hash.clear_all

  puts '1_000_000'
  x.report { 1_000_000.times { |el| hash[el] = el } }
  x.report { 1_000_000.times { |el| my_hash[el] = el } }
end

puts ''
Benchmark.bm do |x|
  hash = {}
  my_hash = MyHash.new

  puts 'Search'
  puts '100'
  100.times { |el| hash[el] = el }
  x.report { hash[100] }
  hash.clear

  100.times { |el| my_hash[el] = el }
  x.report { my_hash[100] }
  my_hash.clear_all

  puts '10_000'
  10_000.times { |el| hash[el] = el }
  x.report { hash[10_000] }
  hash.clear

  10_000.times { |el| my_hash[el] = el }
  x.report { my_hash[10_000] }
  my_hash.clear_all

  puts '1_000_000'
  1_000_000.times { |el| hash[el] = el }
  x.report { hash[1_000_000] }

  1_000_000.times { |el| my_hash[el] = el }
  x.report { my_hash[1_000_000] }
end
