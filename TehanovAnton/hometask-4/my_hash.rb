# frozen_string_literal: true

# this class is my realisation of Hash
class MyHash
  include Enumerable

  LOAD_FACTOR = 0.7

  def initialize
    @size = 10
    @slots = Array.new(size) { [] }
    @pair_count = 0
  end

  def [](key)
    collision = slot(key)

    key_value = collision.find { |k, _| k == key }

    key_value&.last
  end

  def []=(key, value)
    resize! if resize?

    collision = slot(key)
    key_value = collision.find { |k, _| k == key }

    add_pair(collision, [key, value]) if collision.empty? || key_value.nil?
    key_value[1] = value if key_value
  end

  def delete(key)
    slot(key).delete_if { |k, _| k == key }
  end

  def clear
    @size = 10
    @slots = Array.new(size) { [] }
    @pair_count = 0
  end

  def length
    @pair_count
  end

  def each(&block)
    @slots.each(&block)
  end

  private

  attr_reader :pair_count, :size, :slots

  def hash_key(key, hash_size: size)
    key.hash % hash_size
  end

  def resize?
    (pair_count + 1) >= size * LOAD_FACTOR
  end

  def resize!
    old_key_values = slots
    @pair_count = 0

    @size *= 2
    @slots = Array.new(size) { [] }

    old_key_values.flatten.each_slice(2) do |k, v|
      self[k] = v
    end
  end

  def slot(key)
    slot = hash_key(key)
    @slots[slot]
  end

  def add_pair(collision, pair)
    collision.push(pair)
    @pair_count += 1
  end
end
