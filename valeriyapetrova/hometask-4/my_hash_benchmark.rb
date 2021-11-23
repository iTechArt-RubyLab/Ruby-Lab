#!/usr/bin/env ruby

# frozen_string_literal: true

require 'benchmark'
require './my_hash'

h = 100
t = 1000
ten_t = 10_000

Benchmark.bm do |a|
  hash = {}
  my_hash = MyHash.new

  p 'Hash'

  a.report { hash[h] }

  a.report { hash[t] }

  a.report { hash[ten_t] }

  p 'MyHash'

  a.report { my_hash[h] }

  a.report { my_hash[t] }

  a.report { my_hash[ten_t] }
end

Benchmark.bm do |a|
  hash = {}
  my_hash = MyHash.new

  p 'Hash determines size'

  a.report { h.times { |x| hash[x] = x } }
  hash.size

  a.report { t.times { |x| hash[x] = x } }
  hash.size

  a.report { ten_t.times { |x| hash[x] = x } }

  a.report { t.times { |x| my_hash[x] = x } }
  my_hash.size_of_my_hash

  a.report { h.times { |x| my_hash[x] = x } }
  my_hash.size_of_my_hash

  a.report { ten_t.times { |x| my_hash[x] = x } }

  p 'Hash delete everything'

  a.report { h.times { |x| hash[x] = x } }
  hash.clear

  a.report { t.times { |x| hash[x] = x } }
  hash.clear

  a.report { ten_t.times { |x| hash[x] = x } }

  a.report { h.times { |x| my_hash[x] = x } }
  my_hash.cleaning

  a.report { t.times { |x| my_hash[x] = x } }
  my_hash.cleaning

  a.report { ten_t.times { |x| my_hash[x] = x } }
end
