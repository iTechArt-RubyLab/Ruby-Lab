# frozen_string_literal: true

# this class is my realisation of Hash
class MyHash
  include Enumerable

  LOAD_FACTOR = 0.7
  DEFAULT_SIZE = 10

  def initialize
    initialize_hash!
  end

  def [](key)
    pair = pair(key)

    pair&.last
  end

  def []=(key, value)
    resize! if resize?

    slot = slot(key)
    pair = pair(key, slot: slot)

    pair.nil? ? add_pair(key, value, slot: slot) : pair[1] = value
  end

  def delete(key)
    slot(key).delete_if { |k, _| k == key }
  end

  def clear
    initialize_hash!
  end

  def length
    @pair_count
  end

  def each(&block)
    @slots.each(&block)
  end

  private

  attr_reader :pair_count, :slots_count, :slots

  def hash_key(key, hash_size: slots_count)
    key.hash % hash_size
  end

  def resize?
    (pair_count + 1) > slots_count * LOAD_FACTOR
  end

  def resize!
    old_slots = slots
    initialize_hash!(slots_count: slots_count * 2)

    old_slots.each do |slot|
      slot.each do |key, value|
        self[key] = value
      end
    end
  end

  def slot(key)
    slots[hash_key(key)]
  end

  def pair(key, slot: slot(key))
    slot.find { |k, _| k == key }
  end

  def add_pair(key, value, slot: slot(key))
    slot.push([key, value])
    @pair_count += 1
  end

  def initialize_hash!(slots_count: DEFAULT_SIZE)
    @slots_count = slots_count
    @pair_count = 0
    initialize_slots
  end

  def initialize_slots
    @slots = Array.new(slots_count) { [] }
  end
end
