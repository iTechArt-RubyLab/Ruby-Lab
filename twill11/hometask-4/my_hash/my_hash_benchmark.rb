# frozen_string_literal: true

require 'benchmark'
require_relative 'my_hash'

Benchmark.bm do |x|
  my_hash = MyHash.new

  puts 'My own Hash'

  x.report('Set value') { 1_000_000.times { |value| my_hash[value] = value } }
  x.report('999_999') { my_hash[999_999] }
  x.report('delete') { my_hash.delete(999_999) }
  x.report('size') { my_hash.size }
  x.report('clear') { my_hash.clear }

  hash = {}

  puts 'Ruby Hash'

  x.report('Set value') { 1_000_000.times { |value| hash[value] = value } }
  x.report('999_999') { hash[999_999] }
  x.report('delete') { hash.delete(999_999) }
  x.report('length') { hash.length }
  x.report('clear') { hash.clear }
end
