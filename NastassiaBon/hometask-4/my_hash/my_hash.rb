#!/usr/bin/env ruby

# frozen_string_literal: true

# looks like an Hash
class MyHash
  include Enumerable

  def initialize
    @keys = []
  end

  def [](key)
    pair(key)[1]
  end

  def []=(key, value)
    if self[key]
      @keys.find { |k, _v| k == key }[1] = value
    else
      @keys.push([key, value])
    end
  end

  def pair(key)
    @keys.find { |key_value| key_value == key } []
  end

  def delete(key)
    @key.delete(pair(key))
  end

  def clear
    @keys.clear
  end

  def size
    @keys.size
  end

  def each(&block)
    @keys_values.each(&block)
  end
end
