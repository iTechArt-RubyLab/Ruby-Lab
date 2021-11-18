# frozen_string_literal: true

# this class is my realisation of Hash
class MyHash
  include Enumerable

  LOAD_FACTOR = 0.7

  def initialize
    @size = 10
    @keys_values = Array.new(size) { [] }
    @count = 0
  end

  def [](key)
    slot = hash_key(key)
    collision = @keys_values[slot]

    key_value = collision.find { |k, _| k == key }

    key_value&.last
  end

  def []=(key, value)
    resize! if resize?

    slot = hash_key(key)
    collision = @keys_values[slot]
    key_value = collision.find { |k, _| k == key }

    add_pair(collision, [key, value]) if collision.empty? || key_value.nil?
    key_value[1] = value if key_value
  end

  def clear(key)
    slot(key).delete_if { |k, _| k == key }
  end

  def clear_all
    @size = 10
    @keys_values = Array.new(size) { [] }
    @count = 0
  end

  def length
    @count
  end

  def each(&block)
    @keys_values.each(&block)
  end

  private

  attr_reader :count, :size, :keys_values

  def hash_key(key, hash_size: size)
    key.hash % hash_size
  end

  def resize?
    (count + 1) >= size * LOAD_FACTOR
  end

  def resize!
    old_key_values = keys_values

    @size *= 2
    @keys_values = Array.new(size) { [] }

    old_key_values.flatten.each_slice(2) do |k, v|
      self[k] = v
    end
  end

  def slot(key)
    slot = hash_key(key)
    @keys_values[slot]
  end

  def add_pair(collision, pair)
    collision << pair
    @count += 1
  end
end
