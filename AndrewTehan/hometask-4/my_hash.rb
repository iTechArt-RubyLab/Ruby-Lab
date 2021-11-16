# frozen_string_literal: true

# this class is my realisation of Hash
class MyHash
  include Enumerable

  OCCUPANCY_LEVEL = 0.7

  def initialize
    @size = 10
    @dictionary = Array.new(size) { [] }
    @pair_count = 0
  end

  def []=(key, value)
    resize! if resize?

    collision = dictionary[hash_key(key)]
    key_value = hash_pair(collision, key)

    add_hash(collision, key, value) if collision.empty? || key_value.nil?

    key_value && key_value[1] = value unless collision.empty?
  end

  def [](key)
    collision = dictionary[hash_key(key)]

    key_value = hash_pair(collision, key)
    key_value&.last
  end

  def delete(key)
    @pair_count -= 1
    collision = dictionary[hash_key(key)]
    deleted_pair = collision.dup - collision.delete_if { |pair| pair.first == key }
    deleted_pair.flatten.last
  end

  def delete_all
    @dictionary = Array.new(size) { [] }
    @pair_count = 0
  end

  def length
    pair_count
  end

  private

  attr_reader :pair_count, :size, :dictionary

  def resize?
    (pair_count + 1) > size * OCCUPANCY_LEVEL
  end

  def resize!
    old_dictionary = dictionary

    @size *= 2

    @dictionary = Array.new(size) { [] }
    @pair_count = 0

    old_dictionary.each do |collision|
      collision.each do |k, v|
        self[k] = v
      end
    end
  end

  def hash_key(key, hash_size: size)
    key.hash % hash_size
  end

  def hash_pair(collision, key)
    collision.find { |k, _| k == key }
  end

  def add_hash(collision, key, value)
    collision << [key, value]
    @pair_count += 1
  end

  def each(&block)
    dictionary.each(&block)
  end
end
