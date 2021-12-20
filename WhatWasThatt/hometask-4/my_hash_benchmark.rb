# frozen_string_literal: true

require 'benchmark'
require_relative './my_hash'

def print_real_hash_message(operations)
  print_indicators_message(operations)
  puts 'Real hash'
end

def print_my_hash_message(operations)
  print_indicators_message(operations)
  puts 'My hash'
end

def print_indicators_message(operations)
  puts "Indicators for #{operations} operations"
end

Benchmark.bm do |x|
  my_hash = MyHash.new
  real_hash = {}
  operations = 100
  print_my_hash_message(operations)
  x.report { operations.times { |iterator| my_hash[iterator] = iterator.to_f } }
  x.report { my_hash[50] }
  x.report { my_hash.delete(38) }
  x.report { my_hash.length }
  x.report { my_hash.clear }

  print_real_hash_message(operations)
  x.report { operations.times { |iterator| real_hash[iterator] = iterator.to_f } }
  x.report { real_hash[50] }
  x.report { real_hash.delete(38) }
  x.report { real_hash.length }
  x.report { real_hash.clear }
end

puts 'Indicators for 10_000 operations'
puts 'My hash'
Benchmark.bm do |x|
  my_hash = MyHash.new
  real_hash = {}
  operations = 10_000
  print_my_hash_message(operations)
  x.report { operations.times { |iterator| my_hash[iterator] = iterator.to_f } }
  x.report { my_hash[5000] }
  x.report { my_hash.delete(5783) }
  x.report { my_hash.length }
  x.report { my_hash.clear }

  print_real_hash_message(operations)
  x.report { operations.times { |iterator| real_hash[iterator] = iterator.to_f } }
  x.report { real_hash[5000] }
  x.report { real_hash.delete(5783) }
  x.report { real_hash.length }
  x.report { real_hash.clear }
end

puts 'Indicators for 1_000_000 operations'
puts 'My hash'
Benchmark.bm do |x|
  my_hash = MyHash.new
  real_hash = {}
  operations = 1_000_000
  print_my_hash_message(operations)
  x.report { operations.times { |iterator| my_hash[iterator] = iterator.to_f } }
  x.report { my_hash[500_000] }
  x.report { my_hash.delete(598_234) }
  x.report { my_hash.length }
  x.report { my_hash.clear }

  print_real_hash_message(operations)
  x.report { operations.times { |iterator| real_hash[iterator] = iterator.to_f } }
  x.report { real_hash[500_000] }
  x.report { real_hash.delete(598_234) }
  x.report { real_hash.length }
  x.report { real_hash.clear }
end
