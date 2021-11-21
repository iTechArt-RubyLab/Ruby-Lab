# frozen_string_literal: true

# this class is Hash
class MyHash
  include Enumerable

  attr_reader :pair_count, :arr

  LOAD_FACTOR = 0.7
  INITIAL_SIZE = 10
  FOUR = 4
  def initialize
    initialize_hash
  end

  def [](key)
    ident = key_hash(key)
    arr_find(ident, key)&.last
  end

  def []=(key, value)
    resize if pair_count > @size * LOAD_FACTOR
    ident = key_hash(key)
    pair = arr_find(ident, key)
    if pair.nil?
      push_pair(ident, key, value)
    else
      pair[1] = value
    end
  end

  def delete(key)
    ident = key_hash(key)
    arr[ident].delete_if { |k, _| k == key }
  end

  def clear
    initialize_hash
  end

  def length
    pair_count
  end

  def each(&block)
    arr.each(&block)
  end

  private

  def arr_find(ident, key)
    arr[ident].find { |k, _| k == key }
  end

  def key_hash(key)
    key.hash % @size
  end

  def push_pair(ident, key, value)
    arr[ident].push([key, value])
    @pair_count += 1
  end

  def resize
    old_slots = arr
    initialize_hash(size: size * FOUR)
    old_slots.each do |old_slot|
      old_slot.each do |key, value|
        self[key] = value
      end
    end
  end

  def initialize_hash(size: INITIAL_SIZE)
    @size = size
    @pair_count = 0
    @arr = Array.new(@size) { [] }
  end
end
