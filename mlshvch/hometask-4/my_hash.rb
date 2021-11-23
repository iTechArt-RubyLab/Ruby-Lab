#!/usr/bin/env ruby

# frozen_string_literal: true

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
    @hash_table_size = EMPTY_HASH_TABLE_SIZE
    @hash_table = Array.new(EMPTY_HASH_TABLE_SIZE) { [] }
    @number_of_entries = 0
  end

  def size
    @number_of_entries
  end

  def each(&block)
    @hash_table.each(&block)
  end

  private

  def requires_resizing?
    @number_of_entries.fdiv(@hash_table_size) > HASH_LOAD_FACTOR
  end

  def rehash_table
    tmp_hash_table = @hash_table
    @hash_table_size *= 2
    @hash_table = Array.new(@hash_table_size) { [] }
    tmp_hash_table.each do |bucket|
      bucket.each { |pair| self[pair[0]] = pair.last }
    end
  end

  def calculate_hash_table_index(key)
    key.hash % @hash_table_size
  end

  def write_to_hash(index, key, value)
    bucket = @hash_table[index]
    if bucket.assoc(key)
      bucket.assoc(key)[1] = value
    else
      bucket << [key, value]
      @number_of_entries += 1
    end
    value
  end

  def create_empty_hash
    clean
  end
end
