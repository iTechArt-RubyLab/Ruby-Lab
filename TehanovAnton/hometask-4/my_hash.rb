# frozen_string_literal: true

# This is my Hash realisation
class MyHash
  include Enumerable

  LOAD_FACTOR = 0.7
  DEFAULT_SIZE = 10

  def initialize
    initialize_hash!
  end

  def [](key)
    key_value = pair(key)
    key_value&.last
  end

  def []=(key, value)
    resize! if resize?

    current_slot = slot(key)
    key_value = pair(key, slot: current_slot)

    key_value.nil? ? add_pair(key, value, slot: current_slot) : key_value[1] = value
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

  def size
    @pair_count
  end

  def each(&block)
    @slots.each(&block)
  end

  private

  attr_reader :pair_count, :slots_count, :slots

  def hash_key(key)
    key.hash % slots_count
  end

  def resize?
    (pair_count + 1) > slots_count * LOAD_FACTOR
  end

  def resize!
    old_slots = slots
    initialize_hash!(slots_count: slots_count * 2)

    old_slots.each do |current_slot|
      current_slot.each do |key, value|
        self[key] = value
      end
    end
  end

  def slot(key)
    slots[hash_key(key)]
  end

  def pair(key, slot: nil)
    slot ||= slot(key)
    slot.find { |k, _| k == key }
  end

  def add_pair(key, value, slot: nil)
    slot ||= slot(key)
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
