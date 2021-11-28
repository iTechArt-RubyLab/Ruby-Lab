#!/usr/bin/env ruby

# frozen_string_literal: true

require 'benchmark'
require_relative 'my_hash'

Benchmark.bm do |x|
  puts 'MyHash'
  my_hash = MyHash.new
  x.report('1_000       ') { 1_000.times { |value| my_hash[value] = value } }
  my_hash.clear
  x.report('10_000      ') { 10_000.times { |value| my_hash[value] = value } }
  my_hash.clear
  x.report('read(100)   ') { my_hash[100] }
  x.report('read(10_000)') { my_hash[10_000] }
  x.report('delete      ') { my_hash.delete(9) }
  x.report('clear       ') { my_hash.clear }
  x.report('length      ') { my_hash.length }
  puts 'Hash'
  hash = {}
  x.report('1_000       ') { 1_000.times { |value| hash[value] = value } }
  x.report('10_000      ') { 10_000.times { |value| hash[value] = value } }
  x.report('read(100)   ') { hash[100] }
  x.report('read(10_000)') { hash[10_000] }
  x.report('delete      ') { hash.delete(9) }
  x.report('clear       ') { hash.clear }
  x.report('length      ') { hash.length }
end
