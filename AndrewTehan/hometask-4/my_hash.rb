# frozen_string_literal: true

# this class is my realisation of Hash
class MyHash
  include Enumerable

  OCCUPANCY_LEVEL = 0.7
  DEFAULT_DICTIONARY_SIZE = 10

  def initialize
    @size = DEFAULT_DICTIONARY_SIZE
    reset_dictionary
  end

  def []=(key, value)
    resize! if full_dictionary?

    slot = slot(key)
    pair = hash_pair(slot, key)

    add_hash(slot, key, value) if slot.empty? || pair.nil?

    pair[1] = value if pair && !slot.empty?
  end

  def [](key)
    collision = slot(2)

    hash_pair(collision, key)&.last
  end

  def delete(key)
    @pair_count -= 1

    deleted_pair = slot(key).yield_self do |collision|
      collision.dup - collision.delete_if { |k, _| k == key }
    end.first

    deleted_pair&.last
  end

  private

  attr_accessor :pair_count, :size, :dictionary

  def slot(key)
    dictionary[hash_key(key)]
  end

  def full_dictionary?
    (pair_count + 1) > size * OCCUPANCY_LEVEL
  end

  def resize!
    old_dictionary = dictionary

    @size *= 2

    reset_dictionary

    old_dictionary.each do |collision|
      collision.each { |k, v| self[k] = v }
    end
  end

  def hash_key(key)
    key.hash % size
  end

  def hash_pair(slot, key)
    slot.find { |k, _| k == key }
  end

  def reset_dictionary
    @pair_count = 0
    @dictionary = Array.new(size) { [] }
  end

  def add_hash(slot, key, value)
    @pair_count += 1
    slot << [key, value]
  end

  def each(&block)
    dictionary.each(&block)
  end

  alias length pair_count
  alias delete_all reset_dictionary

  public :length, :delete_all
end
