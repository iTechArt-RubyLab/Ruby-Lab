#!/usr/bin/env ruby

# frozen_string_literal: true

require 'digest'

# class MyHash with custom implementation of Hash Table
class MyHash
  def initialize
    @hash_table_size = 10_000_000
    @hash_table = Array.new(@hash_table_size, nil)
    @number_of_entries = 0
  end

  def calculate_hash_value(key)
    sha = Digest::SHA2.hexdigest(key)
    hash = 0
    4.times do |index|
      hash += sha[index].ord * 10**(6 - index * 2)
    end
    hash
  end

  def add(key, value)
    hash_value = calculate_hash_value(key)
    if !@hash_table[hash_value].nil?
      @hash_table[hash_value] << [key, value]
    else
      @hash_table[hash_value] = [key, value]
    end
    @number_of_entries += 1
  end

  def get(key)
    hash_value = calculate_hash_value(key)
    return @hash_table[hash_value][1] if !@hash_table[hash_value].nil? && @hash_table[hash_value].include?(key)

    'key not found'
  end

  def clear
    initialize
  end

  def size
    @number_of_entries
  end

  def exists?(key)
    !@hash_table[calculate_hash_value(key)].nil?
  end

  def show
    @hash_table.each do |value|
      pp value unless value.nil?
    end
  end

  def load_factor
    @number_of_entries.to_f / @hash_table_size
  end
end
