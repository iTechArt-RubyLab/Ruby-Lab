# frozen_string_literal: true

require 'benchmark'

# this class is Hash
class MyHash
  include Enumerable

  attr_reader :pair_count, :size, :arr

  LOAD_FACTOR = 0.5
  SIZE = 10

  def initialize
    initialize_hash
  end

  def [](key)
    ident = key.hash % @size
    arr[ident].find { |k, _| k == key }&.last
  end

  def []=(key, value)
    resize if (pair_count) > @size * LOAD_FACTOR
    ident = key.hash % @size
    pair = arr[ident].find { |k, _| k == key }
    if pair.nil?
      push_pair(ident, key, value)
    elsif pair[0] == key
      pair[1] = value
    else
      push_pair(ident, key, value)
    end
  end

  def push_pair(ident, key, value)
    arr[ident].push([key, value])
    @pair_count += 1
  end

  def delete(key)
    ident = key.hash % @size
    arr[ident].delete_if { |k, _| k == key }
  end

  def clear
    initialize_hash
  end

  def length
    @pair_count
  end

  def each(&block)
    @arr.each(&block)
  end

  def resize
    old_slots = arr
    initialize_hash(size: size * 4)
    old_slots.each do |slot|
      slot.each do |key, value|
        self[key] = value
      end
    end
  end

  def initialize_hash(size: SIZE)
    @size = size
    @pair_count = 0
    initialize_slots
  end

  def initialize_slots
    @arr = Array.new(@size) { [] }
  end
end

# h = MyHash.new
# h['key1'] = 'value1'
# h['key1'] = 'value2'
# h['key3'] = 'value3'
# h['key3'] = 'value4'
# print h['key1']
# print h['key3']
