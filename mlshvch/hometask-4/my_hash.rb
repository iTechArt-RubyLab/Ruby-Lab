#!/usr/bin/env ruby

# frozen_string_literal: true

require 'digest'

# class MyHash with custom implementation of Hash Table
class MyHash
  include Enumerable

  EMPTY_HASH_TABLE_SIZE = 10
  HASH_LOAD_FACTOR = 0.7

  def initialize
    create_empty_hash
  end

  def []=(key, value)
    rehash_table if requires_resizing?
    index = calculate_hash_table_index(key)
    write_to_hash(index, key, value)
    @hash_table[index].assoc(key)[1]
  end

  def [](key)
    index = calculate_hash_table_index(key)
    key_value_pair = @hash_table[index].assoc(key)
    return nil unless key_value_pair

    key_value_pair.last
  end

  def delete(key)
    index = calculate_hash_table_index(key)
    key_value_pair = @hash_table[index].assoc(key)
    return nil unless key_value_pair

    @number_of_entries -= 1
    @hash_table[index].delete(key_value_pair).last
  end

  def clean
    create_empty_hash
  end

  def size
    @number_of_entries
  end

  private

  def requires_resizing?
    (@number_of_entries.to_f / @hash_table_size) > HASH_LOAD_FACTOR
  end

  def rehash_table
    @hash_table += Array.new(@hash_table_size, [])
    @hash_table_size *= 2
    @number_of_entries = 0
    @hash_table.each_index do |index|
      @hash_table[index].each_with_index do |key_value_pair, bucket_index|
        @hash_table[index].delete_at(bucket_index)
        self[key_value_pair[0]] = key_value_pair[1]
      end
    end
  end

  def calculate_hash_table_index(key)
    key.hash % @hash_table_size
  end

  def write_to_hash(index, key, value)
    if @hash_table[index].empty?
      @hash_table[index] = [[key, value]]
      @number_of_entries += 1
    elsif @hash_table[index].assoc(key)
      @hash_table[index].each { |bucket_elem| bucket_elem[1] = value if bucket_elem[0] == key }
    else
      @hash_table[index] << [key, value]
      @number_of_entries += 1
    end
  end

  def create_empty_hash(hash_table_size = EMPTY_HASH_TABLE_SIZE)
    @hash_table_size = hash_table_size
    @hash_table = Array.new(EMPTY_HASH_TABLE_SIZE, [])
    @number_of_entries = 0
  end
end
