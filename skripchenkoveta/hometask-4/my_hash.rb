# frozen_string_literal: true

require 'objspace'

# Implementation of the MyHash class of task 4.2
class MyHash
  attr_reader :count, :myhash, :size

  include Enumerable

  LOAD_FACTOR = 0.7

  def initialize
    @size = 10
    @count = 0
    @myhash = Array.new(@size) { [] }
  end

  def [](key)
    get(key_hash(key), key)[1]
  end

  def []=(key, value)
    resize if @count.to_f / @size > LOAD_FACTOR
    index = key_hash(key)
    pair = get(index, key)
    if pair
      pair[1] = value
    else
      @count += 1
      @myhash[index].push([key, value])
    end
  end

  def get(index, key)
    @myhash[index].find { |item, _| item == key }
  end

  def key_hash(key)
    key.hash % size
  end

  def resize
    old_myhash = @myhash
    @size *= 2
    @myhash = Array.new(@size) { [] }
    old_myhash.each do |array_item|
      array_item.each do |key, value|
        self[key] = value
      end
    end
  end

  def memory_size
    ObjectSpace.memsize_of(@myhash)
  end

  def delete(key)
    @myhash[key_hash(key)].delete_if { |item, _| item == key }
  end

  def clear
    initialize
  end

  def length
    @count
  end

  def each(&block)
    @myhash.each(&block)
  end
end
