#!/usr/bin/env ruby
# frozen_string_literal: true

module ConstantsForMyHash
  KEY_POS = 0
  VALEU_POS = 1
  START_SIZE = 16
  LOAD_FACTOR = 0.5
end

# Trying to make class MyHash look like the original class Hash
class MyHash
  include Enumerable
  include ConstantsForMyHash

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
    @hash_array[define_pos(key)].each do |item|
      value = item[VALEU_POS] if item[KEY_POS].equal?(key)
    end
    value
  end

  def []=(key, value)
    return if pos_in_bucket_if_present_in_hash(key)

    insertion(key, value)
    @size += 1
    increase_hash_array if @size >= @current_size * LOAD_FACTOR
  end

  def delete(key)
    pos_in_bucket = pos_in_bucket_if_present_in_hash(key)
    return unless pos_in_bucket

    @hash_array[@position].delete_at(pos_in_bucket)
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

  def define_pos(key)
    hash_value = key.hash
    return @position = hash_value % @current_size if hash_value.positive?

    @position = -hash_value % @current_size
  end

  def pos_in_bucket_if_present_in_hash(key)
    define_pos(key)
    pos_in_bucket = false
    @hash_array[@position].each_with_index do |item, index|
      pos_in_bucket = index if item[KEY_POS].eql?(key)
    end
    pos_in_bucket
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
        self[pair[KEY_POS]] = pair[VALEU_POS] if pair
      end
    end
    @old_array = nil
  end
end
