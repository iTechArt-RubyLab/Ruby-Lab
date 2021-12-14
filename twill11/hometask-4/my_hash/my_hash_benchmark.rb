# frozen_string_literal: true

require 'benchmark'
require_relative 'my_hash'

Benchmark.bm do |x|
  my_hash_variable = MyHash.new

  puts 'My own Hash'

  x.report { 1_000_000.times { |value| my_hash_variable[value] = value } }
  x.report { my_hash_variable[70] }
  x.report { my_hash_variable.delete(100) }
  x.report { my_hash_variable.size }
  x.report { my_hash_variable.clear }

  hash = {}

  puts 'Ruby Hash'

  x.report { 1_000_000.times { |value| hash[value] = value } }
  x.report { hash[70] }
  x.report { hash.delete(100) }
  x.report { hash.length }
  x.report { hash.clear }
end
