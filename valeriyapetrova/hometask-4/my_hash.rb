#!/usr/bin/env ruby

# frozen_string_literal: true

# looks like an hash
class MyHash
  include Enumerable
  DEFAULT_MY_HASH_SIZE = 10
  INIT_MY_HASH_COUNT = 0
  CAPACITY = 0.7
  KEY = 0
  VALUE = 1

  def initialize
    @size = DEFAULT_MY_HASH_SIZE
    @count = INIT_MY_HASH_COUNT
    @current_custom_hash = Array.new(DEFAULT_MY_HASH_SIZE) { [] }
  end

  def []=(key_input, value_input)
    resize if (@count.to_f / @size) > CAPACITY

    pair = pair(key_input)
    if pair
      pair[VALUE] = value_input
    else
      @count += 1
      @current_custom_hash[slot(key_input)] << [key_input, value_input]
    end
  end

  def [](key_input)
    pair = pair(key_input)

    pair ? pair[VALUE] : nil
  end

  def delete(key_input)
    pair = pair(key_input)
    return unless pair

    @count -= 1
    @current_custom_hash[slot(key_input)].delete(pair)
  end

  def size_of_my_hash
    @count
  end

  def cleaning
    @current_custom_hash.clear
    initialize
  end

  private

  def pair(key_input)
    @current_custom_hash[slot(key_input)]&.find do |another_key|
      another_key[KEY] == key_input
    end
  end

  def slot(key_input)
    key_input.hash % @size
  end

  def resize
    @current_custom_hash.concat(Array.new(@size) { [] })
    @size *= 2
  end
end
