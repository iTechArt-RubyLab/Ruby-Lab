#!/usr/bin/env ruby
# frozen_string_literal: true

# Trying to make class MyHash look like the original class Hash
class MyHash
  include Enumerable

  KEY_POSITION = 0
  VALUE_POSITION = 1
  START_SIZE = 16
  LOAD_FACTOR = 0.5

  attr_reader :size

  def initialize
    clear
  end

  def [](key)
    slot = @hash_array[define_position(key)]
    key_value = slot.find { |k, _| k == key }
    key_value&.last
  end

  def []=(key, value)
    increase_hash_array if @size >= @current_size * LOAD_FACTOR
    slot = @hash_array[define_position(key)]
    key_value = slot.find { |k, _| k == key }
    key_value.nil? ? insertion(key, value, slot) : key_value[VALUE_POSITION] = value
  end

  def delete(key)
    position_in_bucket = position_in_bucket_if_present_in_hash(key)
    return unless position_in_bucket

    @hash_array[define_position(key)].delete_at(position_in_bucket)
    @size -= 1
  end

  def clear
    @current_size = START_SIZE
    @hash_array = Array.new(@current_size) { [] }
    @size = 0
    @old_array = nil
  end

  def each(&block)
    @hash_array.each do |line_of_pair|
      line_of_pair.each(&block)
    end
  end

  private

  def insertion(key, value, slot)
    slot.push([key, value])
    @size += 1
  end

  def define_position(key)
    key.hash.abs % @current_size
  end

  def position_in_bucket_if_present_in_hash(key)
    @hash_array[define_position(key)].each_with_index do |item, index|
      return index if item[KEY_POSITION].eql?(key)
    end

    nil
  end

  def increase_hash_array
    @old_array = @hash_array
    @hash_array = Array.new(@current_size *= 2) { [] }
    reinsert
  end

  def reinsert
    @size = 0
    @old_array.each do |line_of_pair|
      line_of_pair.each do |pair|
        self[pair[KEY_POSITION]] = pair[VALUE_POSITION] if pair
      end
    end
    @old_array = nil
  end
end
