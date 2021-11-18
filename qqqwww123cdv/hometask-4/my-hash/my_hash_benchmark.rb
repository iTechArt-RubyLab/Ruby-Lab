#!/usr/bin/env ruby
# frozen_string_literal: true

require 'benchmark'
require './my_hash'

Benchmark.bm do |x|
  puts 'MyHash'
  my_hash = MyHash.new
  x.report { 100.times { |value| my_hash[value] = value } }
  x.report { 100.times { |value| my_hash[value] = value } }
  x.report { my_hash.delete(1) }
  x.report { my_hash.delete(8) }
  x.report { my_hash.clear }
  x.report { my_hash.clear }
  x.report { my_hash.length }
  x.report { my_hash.length }

  puts 'Hash'
  hash = {}
  x.report { 100.times { |value| hash[value] = value } }
  x.report { 100.times { |value| hash[value] = value } }
  x.report { hash.delete(1) }
  x.report { hash.delete(1) }
  x.report { hash.length }
  x.report { hash.length }
  x.report { hash.clear }
  x.report { hash.clear }
end
