#!/usr/bin/env ruby

# frozen_string_literal: true

require 'digest'
# class MyHash with custom implementation of Hash Table
class MyHash
  include Enumerable
  EMPTY_HASH_TABLE_SIZE = 10

  def initialize
    create_empty_hash
  end

  def create_empty_hash(hash_table_size = EMPTY_HASH_TABLE_SIZE)
    @hash_table_size = hash_table_size
    @hash_table = Array.new(EMPTY_HASH_TABLE_SIZE, [])
    @number_of_entries = 0.0
    self
  end

  def calculate_hash_table_index(key)
    # sha = Digest::SHA2.hexdigest(key.to_s)
    # hash = ''
    # 10.times do |index|
    #   hash += sha[index].ord.to_s
    # end
    # hash.to_i % @hash_table_size
    key.hash % @hash_table_size
  end

  def []=(key, value)
    index = calculate_hash_table_index(key)
    @hash_table[index] = if @hash_table[index].to_a.empty? || @hash_table[index].to_a.assoc(key)
                           [[key, value]]
                         else
                           @hash_table[index].to_a.append([key, value])
                         end
    @number_of_entries += 1
    rehash_table
  end

  def [](key)
    index = calculate_hash_table_index(key)
    @hash_table[index].to_a.assoc(key).last unless @hash_table[index].to_a.empty?
  end

  def delete(key)
    @number_of_entries -= 1
    index = calculate_hash_table_index(key)
    @hash_table[index].to_a.each_with_index do |elem, bucket_index|
      return @hash_table[index].delete_at(bucket_index).last if elem[0] == key
    end
    @number_of_entries += 1
    nil
  end

  def clean
    create_empty_hash
  end

  def load_factor
    @number_of_entries / @hash_table_size
  end

  def show
    @hash_table.each_index do |index|
      puts "#{index}: #{@hash_table[index]}"
    end
  end

  def size
    @number_of_entries
  end

  def rehash_table
    return unless load_factor > 0.7

    old_hash_table = Array.new(@hash_table_size, []).replace(@hash_table)
    old_hash_table_size = @hash_table_size
    create_empty_hash(old_hash_table_size * 2)
    old_hash_table.each_index do |index|
      next if old_hash_table[index].nil?
      old_hash_table[index].each do |key_value_pair|
        restore(key_value_pair[0], key_value_pair[1])
      end
    end
    @hash_table
  end

  private

  def restore(key, value)
    index = calculate_hash_table_index(key)
    @hash_table[index] = if @hash_table[index].to_a.empty? || @hash_table[index].to_a.assoc(key)
                           [[key, value]]
                         else
                           @hash_table[index].to_a.append([key, value])
                         end
    @number_of_entries += 1
  end
end
