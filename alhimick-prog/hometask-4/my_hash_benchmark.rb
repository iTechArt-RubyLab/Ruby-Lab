# !/usr/bin/env ruby
# frozen_string_literal: true

require 'benchmark'
require './my_hash'

native_hash = {}
my_hash = MyHash.new

Benchmark.bm do |x|
  puts 'Creation:'
  x.report('native') { native_hash = {} }
  x.report('custom') { my_hash = MyHash.new }
end

Benchmark.bm do |x|
  native_hash = {}
  my_hash = MyHash.new
  puts 'Insertion:'
  puts '<<<<<Size: 1000>>>>>'
  x.report('native') do
    1000.times { |i| native_hash["#{i}"] = "it's #{i}" }
  end
  x.report('custom') do
    1000.times { |i| my_hash["#{i}"] = "it's #{i}" }
  end
  puts '<<<<<Size: 1000 to 1_000_000>>>>>'
  x.report('native') do
    1_000_000.times { |i| native_hash["#{i}"] = "it's #{i}" }
  end
  x.report('custom') do
    1_000_000.times { |i| my_hash["#{i}"] = "it's #{i}" }
  end
end

Benchmark.bm do |x|
  native_hash = {}
  my_hash = MyHash.new
  1_000_000.times { |i| native_hash["#{i}"] = "it's #{i}" }
  1_000_000.times { |i| my_hash["#{i}"] = "it's #{i}" }
  puts 'Reading when 1_000_000 pairs:'
  puts '<<<<<Count: 10>>>>>'
  x.report('native') do
    10.times do
      i = rand(0..999_999)
      native_hash["#{i}"]
    end
  end
  x.report('custom') do
    10.times do
      i = rand(0..999_999)
      my_hash["#{i}"]
    end
  end
  puts '<<<<<Count: 1_000_000>>>>>'
  x.report('native') do
    1_000_000.times { |i| native_hash["#{i}"] }
  end
  x.report('custom') do
    1_000_000.times { |i| my_hash["#{i}"] }
  end
end

Benchmark.bm do |x|
  native_hash = {}
  my_hash = MyHash.new
  1_000_000.times { |i| native_hash["#{i}"] = "it's #{i}" }
  1_000_000.times { |i| my_hash["#{i}"] = "it's #{i}" }
  puts 'Counting size when 1_000_000 pairs:'
  x.report('native') { native_hash.size }
  x.report('custom') { my_hash.size }
  puts 'Clear when 1_000_000 pairs:'
  x.report('native') { native_hash.clear }
  x.report('custom') { my_hash.clear }
end
