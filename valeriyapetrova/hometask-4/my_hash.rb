#!/usr/bin/env ruby

# frozen_string_literal: true

# looks like an hash
class MyHash
  include Enumerable

  def initialize
    @current_custom_hash = []
  end

  def []=(key_input, value_input)
    @current_custom_hash << [key_input, value_input]
    @current_custom_hash.uniq!
  end

  def keys
    @current_custom_hash.map { |a| a[0] }
  end

  def values
    @current_custom_hash.map { |b| b[1] }
  end

  def [](value)
    pair = @current_custom_hash.find { |b| b[value] }
    pair ? pair[1] : nil
  end

  def delete(key)
    value = @current_custom_hash[key]
    @current_custom_hash = @current_custom_hash.delete([key, value])
  end

  def size_of_my_hash
    @current_custom_hash.size
  end

  def cleaning
    @current_custom_hash.clear
  end
end
