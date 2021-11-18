#!/usr/bin/env ruby
# frozen_string_literal: true

require 'benchmark'
require './my_hash'

Benchmark.bm do |x|
  puts 'MyHash'
  my_hash = MyHash.new
  x.report('10_000') { 10_000.times { |value| my_hash[value] = value } }
  my_hash.clear
  x.report('10_000') { 10_000.times { |value| my_hash[value] = value } }
  my_hash.clear
  x.report('delete') { my_hash.delete(9) }
  x.report('delete') { my_hash.delete(9) }
  x.report('clear') { my_hash.clear }
  x.report('clear') { my_hash.clear }
  x.report('length') { my_hash.length }
  x.report('length') { my_hash.length }

  puts 'Hash'
  hash = {}
  x.report('10_000') { 10_000.times { |value| hash[value] = value } }
  x.report('10_000') { 10_000.times { |value| hash[value] = value } }
  x.report('delete') { hash.delete(9) }
  x.report('delete') { hash.delete(9) }
  x.report('clear') { hash.clear }
  x.report('clear') { hash.clear }
  x.report('length') { hash.length }
  x.report('length') { hash.length }
end
