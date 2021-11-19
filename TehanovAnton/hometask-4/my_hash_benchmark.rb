#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'my_hash'
require 'benchmark'

# Benchmarks for hash
class HashBenchmark
  attr_accessor :hash, :benchmark

  def initialize(hash, benchmark)
    @hash = hash
    @benchmark = benchmark
  end

  def write_report(size)
    benchmark.report("#{size} []=") { fill_hash(size) }
    hash.clear
  end

  def search_report(size)
    fill_hash(size)
    benchmark.report("#{size} []") { hash[size] }
    hash.clear
  end

  private

  def fill_hash(size)
    size.times { |el| hash[el] = el }
  end
end

Benchmark.bm do |x|
  hash_benchmark = HashBenchmark.new({}, x)
  my_hash_benchmark = HashBenchmark.new(MyHash.new, x)

  hash_benchmark.write_report(100)
  my_hash_benchmark.write_report(100)
  puts ''

  hash_benchmark.write_report(10_000)
  my_hash_benchmark.write_report(10_000)
  puts ''

  hash_benchmark.write_report(1_000_000)
  my_hash_benchmark.write_report(1_000_000)
  puts ''

  hash_benchmark.search_report(100)
  my_hash_benchmark.search_report(100)
  puts ''

  hash_benchmark.search_report(10_000)
  my_hash_benchmark.search_report(10_000)
  puts ''

  hash_benchmark.search_report(1_000_000)
  my_hash_benchmark.search_report(1_000_000)
  puts ''
end
