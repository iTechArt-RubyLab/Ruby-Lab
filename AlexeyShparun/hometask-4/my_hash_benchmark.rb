#!/usr/bin/env ruby

# frozen_string_literal: true

require 'benchmark'
require_relative 'hash'

Benchmark.bm do |x|
  puts 'MyHash'
  my_hash = MyHash.new
  x.report('add_value(250)        ') { 250.times { |key, value| my_hash.add_value(key, value) } }
  my_hash.clear
  x.report('add_value(1000)       ') { 1000.times { |key, value| my_hash.add_value(key, value) } }
  my_hash.clear
  x.report('find_key_value(250)   ') { my_hash.find_key_value(250) }
  x.report('find_key_value(1000)  ') { my_hash.find_key_value(1000) }
  x.report('delete                ') { my_hash.delete(36) }
  x.report('clear                 ') { my_hash.clear }
  x.report('length                ') { my_hash.length }
  puts 'Hash'
  hash = {}
  x.report('add_value(250)        ') { 250.times { |value| hash[value] = value } }
  x.report('add_value(1000)       ') { 1000.times { |value| hash[value] = value } }
  x.report('read(100)             ') { hash[250] }
  x.report('read(1000)            ') { hash[1000] }
  x.report('delete                ') { hash.delete(36) }
  x.report('clear                 ') { hash.clear }
  x.report('length                ') { hash.length }
end
