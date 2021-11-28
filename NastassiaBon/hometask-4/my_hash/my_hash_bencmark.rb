#!/usr/bin/env ruby

# frozen_string_literal: true

require 'benchmark'
require_relative 'my_hash'

Benchmark.bm do |x|
  puts 'MyHash'
  puts ' '
  my_hash = MyHash.new
  x.report('add(100)    ') { 100.times { |value| my_hash[value] = value } }
  my_hash.clear
  x.report('add(1000)   ') { 1000.times { |value| my_hash[value] = value } }
  my_hash.clear
  x.report('read(100)   ') { my_hash[100] }
  x.report('read(1000)  ') { my_hash[1000] }
  x.report('delete      ') { my_hash.delete(9) }
  x.report('clear       ') { my_hash.clear }
  x.report('size        ') { my_hash.size }
  puts ' '
  puts 'Hash'
  puts ' '
  hash = {}
  x.report('add(100)    ') { 100.times { |value| hash[value] = value } }
  x.report('add(1000)   ') { 1000.times { |value| hash[value] = value } }
  x.report('read(100)   ') { hash[100] }
  x.report('read(1000)  ') { hash[1000] }
  x.report('delete      ') { hash.delete(9) }
  x.report('clear       ') { hash.clear }
  x.report('length      ') { hash.length }
end
