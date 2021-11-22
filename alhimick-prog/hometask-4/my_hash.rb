#!/usr/bin/env ruby
# frozen_string_literal: true

# Trying to make class MyHash look like the original class Hash
class MyHash
  include Enumerable

  KEY_POSITION = 0
  VALEU_POSITION = 1
  START_SIZE = 16
  LOAD_FACTOR = 0.7

  attr_reader :size

  def initialize
    @current_size = START_SIZE
    @hash_array = Array.new(@current_size) { [] }
    @size = 0
    @old_array = nil
    @position = nil
  end

  def [](key)
    value = nil
    @hash_array[define_position(key)].each do |item|
      value = item[VALEU_POSITION] if item[KEY_POSITION].equal?(key)
    end
    value
  end

  def []=(key, value)
    return if position_in_bucket_if_present_in_hash(key)

    insertion(key, value)
    @size += 1
    increase_hash_array if @size >= @current_size * LOAD_FACTOR
  end

  def delete(key)
    position_in_bucket = position_in_bucket_if_present_in_hash(key)
    return unless position_in_bucket

    @hash_array[@position].delete_at(position_in_bucket)
    @size -= 1
  end

  def clear
    @current_size = START_SIZE
    @hash_array = Array.new(@current_size) { [] }
    @size = 0
    @old_array = nil
    @position = nil
  end

  def each(&block)
    @hash_array.each do |line_of_pair|
      line_of_pair.each(&block)
    end
  end

  private

  def insertion(key, value)
    @hash_array[@position].push([key, value])
  end

  def define_position(key)
    @position = key.hash.abs % @current_size
  end

  def position_in_bucket_if_present_in_hash(key)
    define_position(key)
    @hash_array[@position].each_with_index do |item, index|
      return index if item[KEY_POSITION].eql?(key)
    end

    nil
  end

  def increase_hash_array
    @old_array = @hash_array
    @hash_array = Array.new(@current_size *= 4) { [] }
    reinsert
  end

  def reinsert
    @size = 0
    @old_array.each do |line_of_pair|
      line_of_pair.each do |pair|
        self[pair[KEY_POSITION]] = pair[VALEU_POSITION] if pair
      end
    end
    @old_array = nil
  end
end
