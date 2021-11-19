#!/usr/bin/env ruby
# frozen_string_literal: true

module ConstantsForMyHash
  KEY_POS = 0
  VALEU_POS = 1
  START_SIZE = 13
  LOAD_FACTOR = 0.5
  START_POWER_OF_TWO = 16
  START_ARRAY_OF_PRIME = [2, 3, 5, 7, 11, 13].freeze
  KEY_IS_BUSY_ERROR = 'Key is busy!'
end

# Trying to make class MyHash look like the original class Hash
class MyHash
  include Enumerable
  include ConstantsForMyHash

  attr_reader :size

  def initialize
    @prime_numbers = START_ARRAY_OF_PRIME
    @current_size = START_SIZE
    @limiting_power_of_two = START_POWER_OF_TWO
    @hash_array = Array.new(@current_size) { [] }
    @size = 0
    @temp_array = []
    @position = nil
  end

  def [](key)
    value = nil
    @hash_array[define_pos(key)].each do |item|
      value = item[VALEU_POS] if item[KEY_POS].equal?(key)
    end
    @position = nil
    value
  end

  def []=(key, value)
    if pos_in_bucket_if_present_in_hash(key)
      @position = nil
      return
    end

    insertion(key, value)
    @position = nil
    @size += 1
    increase_hash_array if @size > @current_size * 0.5
  end

  def delete(key)
    pos_in_bucket = pos_in_bucket_if_present_in_hash(key)
    return unless pos_in_bucket

    @hash_array[@position].delete_at(pos_in_bucket)
    @size -= 1
    @position = nil
  end

  def clear
    @prime_numbers = START_ARRAY_OF_PRIME
    @current_size = START_SIZE
    @limiting_power_of_two = START_POWER_OF_TWO
    @hash_array = Array.new(@current_size) { [] }
    @size = 0
    @temp_array = []
    @position = nil
  end

  private

  def insertion(key, value)
    @hash_array[@position].push([key, value])
  end

  def each(&block)
    @hash_array.each do |line_of_pair|
      line_of_pair.each(&block)
    end
  end

  def define_pos(key)
    hash_value = key.hash
    return @position = hash_value % @current_size if hash_value.positive?

    @position = -hash_value % @current_size
  end

  def pos_in_bucket_if_present_in_hash(key)
    define_pos(key)
    @hash_array[@position].each_with_index do |item, index|
      return index if item[KEY_POS].equal?(key)
    end
  end

  def increase_hash_array
    prime_numb_generator
    array_of_pair
    @current_size = @prime_numbers.last
    @hash_array = Array.new(@current_size) { [] }
    reinsert
  end

  def prime_numb_generator
    (@limiting_power_of_two...(@limiting_power_of_two *= 2)).each do |tested_number|
      is_prime = true
      @prime_numbers.each do |divider|
        is_prime = false if (tested_number % divider).zero?
      end
      @prime_numbers.push(tested_number) if is_prime
    end
  end

  def array_of_pair
    @hash_array.each do |line_of_pair|
      line_of_pair.each do |pair|
        @temp_array.push(pair) if pair
      end
    end
  end

  def reinsert
    @size = 0
    @temp_array.each do |pair|
      self[pair[KEY_POS]] = pair[VALEU_POS]
    end
    @temp_array = []
  end
end
