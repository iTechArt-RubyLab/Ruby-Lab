#!/usr/bin/env ruby

# frozen_string_literal: true

require 'benchmark'
require './my_hash'

Benchmark.bm(7) do |x|
  lab_hash = MyHash.new
  hash = {}
  10.times do
    lab_hash[rand] = rand
    hash[rand] = rand
  end
  puts '10 elements:'
  puts 'MyHash write'
  x.report { operations_number.times { |index| lab_hash.add(index.to_s, rand) } }
  puts 'Hash write'
  x.report { operations_number.times { |index| hash[index.to_s] = rand } }
  puts 'MyHash read'
  x.report { operations_number.times { |index| lab_hash.get(index.to_s) } }
  puts 'Hash read'
  x.report { operations_number.times { |index| hash[index.to_s] } }
end

Benchmark.bm(7) do |x|
  lab_hash = MyHash.new
  hash = {}
  1_000.times do
    lab_hash[rand] = rand
    hash[rand] = rand
  end
  puts '1000 elements:'
  puts 'MyHash write'
  x.report { operations_number.times { |index| lab_hash.add(index.to_s, rand) } }
  puts 'Hash write'
  x.report { operations_number.times { |index| hash[index.to_s] = rand } }
  puts 'MyHash read'
  x.report { operations_number.times { |index| lab_hash.get(index.to_s) } }
  puts 'Hash read'
  x.report { operations_number.times { |index| hash[index.to_s] } }
end

Benchmark.bm(7) do |x|
  lab_hash = MyHash.new
  hash = {}
  1_000_000.times do
    lab_hash[rand] = rand
    hash[rand] = rand
  end
  puts '1000 elements:'
  puts 'MyHash write'
  x.report { operations_number.times { |index| lab_hash.add(index.to_s, rand) } }
  puts 'Hash write'
  x.report { operations_number.times { |index| hash[index.to_s] = rand } }
  puts 'MyHash read'
  x.report { operations_number.times { |index| lab_hash.get(index.to_s) } }
  puts 'Hash read'
  x.report { operations_number.times { |index| hash[index.to_s] } }
end

