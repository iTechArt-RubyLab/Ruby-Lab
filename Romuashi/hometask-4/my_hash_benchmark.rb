# frozen_string_literal: true

require 'benchmark'
require './my_hash'

Benchmark.bm do |x|
  puts 'write Hash'

  hash = {}

  x.report { 100.times { |el| hash[el] = el } }
  hash.clear

  x.report { 1000.times { |el| hash[el] = el } }
  hash.clear

  x.report { 10_000.times { |el| hash[el] = el } }

  puts 'write MyHash'
  my_hash = MyHash.new

  x.report { 100.times { |el| my_hash[el] = el } }
  my_hash.delete_all

  x.report { 1000.times { |el| my_hash[el] = el } }
  my_hash.delete_all

  x.report { 10_000.times { |el| my_hash[el] = el } }

  puts 'read Hash'

  x.report { hash[99] }

  x.report { hash[999] }

  x.report { hash[9999] }

  puts 'read MyHash'

  x.report { my_hash[99] }

  x.report { my_hash[999] }

  x.report { my_hash[9999] }
end
