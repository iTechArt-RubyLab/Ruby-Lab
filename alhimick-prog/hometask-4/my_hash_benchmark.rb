# !/usr/bin/env ruby
# frozen_string_literal: true

require 'benchmark'
require './my_hash'

Benchmark.bm do |x|
  native_hash = {}
  my_hash = MyHash.new
  10_000.times do |i|
    native_hash[i] = i
    my_hash[i] = i
  end
  puts '10 insertion when hash size is:'
  puts '<<<<<Size: 10_000>>>>>'
  x.report('native') do
    10.times { |i| native_hash[i.to_s] = i.to_s }
  end
  x.report('custom') do
    10.times { |i| my_hash[i.to_s] = i.to_s }
  end
  (10_000..999_989).each do |i|
    native_hash[i] = i
    my_hash[i] = i
  end
  puts '<<<<<Size: 1_000_000>>>>>'
  x.report('native') do
    (10..19).each { |i| native_hash[i.to_s] = i.to_s }
  end
  x.report('custom') do
    (10..19).each { |i| my_hash[i.to_s] = i.to_s }
  end
end

Benchmark.bm do |x|
  native_hash = {}
  my_hash = MyHash.new
  10_000.times do |i|
    native_hash[i] = i
    my_hash[i] = i
  end
  puts '10 reading when size is:'
  puts '<<<<<Size: 10_000>>>>>'
  x.report('native') do
    10.times do
      i = rand(0..9_999)
      native_hash[i]
    end
  end
  x.report('custom') do
    10.times do
      i = rand(0..9_999)
      my_hash[i]
    end
  end
  (10_000..999_999).each do |i|
    native_hash[i] = i
    my_hash[i] = i
  end
end

Benchmark.bm do |x|
  native_hash = {}
  my_hash = MyHash.new
  1_000_000.times do |i|
    native_hash[i] = i
    my_hash[i] = i
  end
  puts '<<<<<Size: 1_000_000>>>>>'
  x.report('native') do
    10.times do
      i = rand(0..999_999)
      native_hash[i]
    end
  end
  x.report('custom') do
    10.times do
      i = rand(0..999_999)
      my_hash[i]
    end
  end
end

Benchmark.bm do |x|
  native_hash = {}
  my_hash = MyHash.new
  1_000_000.times { |i| native_hash[i.to_s] = "it's #{i}" }
  1_000_000.times { |i| my_hash[i.to_s] = "it's #{i}" }
  puts 'Counting size when 1_000_000 pairs:'
  x.report('native') { native_hash.size }
  x.report('custom') { my_hash.size }
  puts 'Clear when 1_000_000 pairs:'
  x.report('native') { native_hash.clear }
  x.report('custom') { my_hash.clear }
end
