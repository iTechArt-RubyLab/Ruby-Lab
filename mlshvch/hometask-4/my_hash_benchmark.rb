#!/usr/bin/env ruby

# frozen_string_literal: true

require 'benchmark'
require './my_hash'
EXIT_MESSAGE = 'exit!'

def run_benchmark(operations_number)
  Benchmark.bm(7) do |x|
    lab_hash = MyHash.new
    hash = {}
    puts 'MyHash write'
    x.report { operations_number.times { |index| lab_hash.add(index.to_s, rand) } }
    puts 'Hash write'
    x.report { operations_number.times { |index| hash[index.to_s] = rand } }
    puts 'MyHash read'
    x.report { operations_number.times { |index| lab_hash.get(index.to_s) } }
    puts 'Hash read'
    x.report { operations_number.times { |index| hash[index.to_s] } }
  end
end

def run_cli
  loop do
    print 'Enter number of operations: '
    operations_number = gets.chomp
    break if operations_number == EXIT_MESSAGE

    run_benchmark(operations_number.to_i)
  end
end

run_cli

