# frozen_string_literal: true

# this class is my realisation of Hash
class MyHash
  include Enumerable

  LOAD_FACTOR = 0.7

  def initialize
    dictionary
  end

  def [](key)
    arr_find(key_hash(key), key)&.last
  end

  def []=(key, value)
    resize if count > size * LOAD_FACTOR
    id = key_hash(key)
    pair = arr_find(id, key)
    if pair
      pair[1] = value
    else
      push_pair(id, key, value)
    end
  end

  def delete(key)
    arr[key_hash(key)].delete_if { |k, _| k == key }
  end

  def clear
    dictionary
  end

  def length
    count
  end

  def each(&block)
    arr.each(&block)
  end

  private

  attr_reader :count, :arr, :size

  def arr_find(id, key)
    arr[id].find { |k, _| k == key }
  end

  def key_hash(key)
    key.hash % size
  end

  def push_pair(id, key, value)
    arr[id].push([key, value])
    @count += 1
  end

  def resize
    old_cell = arr
    dictionary(size: size * 4)
    old_cell.each do |old_cel|
      old_cel.each do |key, value|
        self[key] = value
      end
    end
  end

  def dictionary(size: 10)
    @size = size
    @count = 0
    @arr = Array.new(@size) { [] }
  end
end
