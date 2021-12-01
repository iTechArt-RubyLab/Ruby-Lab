# frozen_string_literal: true

# this class is Hash
class MyHash
  include Enumerable

  LOAD_FACTOR = 0.7
  INITIAL_SIZE = 10
  RESIZE_FACTOR = 4

  def initialize
    initialize_hash
  end

  def [](key)
    arr_find(key_hash(key), key)&.last
  end

  def []=(key, value)
    resize if pair_count > size * LOAD_FACTOR
    ident = key_hash(key)
    pair = arr_find(ident, key)
    if pair
      pair[1] = value
    else
      push_pair(ident, key, value)
    end
  end

  def delete(key)
    @size -= 1
    arr[key_hash(key)].delete_if { |k, _| k == key }
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

  attr_reader :pair_count, :arr, :size

  def arr_find(ident, key)
    arr[ident].find { |k, _| k == key }
  end

  def key_hash(key)
    key.hash % size
  end

  def push_pair(ident, key, value)
    arr[ident].push([key, value])
    @pair_count += 1
  end

  def resize
    old_slots = arr
    initialize_hash(size: size * RESIZE_FACTOR)
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

# h = MyHash.new
# h[:key1] = :value1
# print h.length
# h.delete(:key1)
# print h.length
