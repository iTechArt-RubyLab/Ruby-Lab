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

  def write(size)
    benchmark.report("#{size} write") { hashe(size) }
    hash.clear
  end

  def search(size)
    hashe(size)
    benchmark.report("#{size} search") { hash[size] }
    hash.clear
  end

  def hashe(size)
    size.times { |el| hash[el] = el }
  end
end

Benchmark.bm do |x|
  hash = HashBenchmark.new({}, x)
  my_hash = HashBenchmark.new(MyHash.new, x)

  hash.write(100)
  my_hash.write(100)

  hash.write(10_000)
  my_hash.write(10_000)

  hash.write(1_000_000)
  my_hash.write(1_000_000)

  hash.search(100)
  my_hash.search(100)

  hash.search(10_000)
  my_hash.search(10_000)

  hash.search(1_000_000)
  my_hash.search(1_000_000)
end
