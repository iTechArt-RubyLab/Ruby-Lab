#!/usr/bin/env ruby
# frozen_string_literal: true

# Trying to make class MyHash look like the original class Hash
class MyHash
  include Enumerable

  KEY_POS = 0
  VALEU_POS = 1
  KEY_IS_BUSY_ERROR = 'Key is busy!'

  def initialize
    @values = []
  end

  def [](key)
    value = nil
    @values.each do |item|
      value = item[VALEU_POS] if item[KEY_POS].equal?(key)
    end
    value
  end

  def []=(key, value)
    are_in_hash?(key) ? puts(KEY_IS_BUSY_ERROR) : set(key, value)
  end

  def are_in_hash?(key)
    are = false
    @values.each do |key_and_value|
      are = true if key_and_value[KEY_POS].equal?(key)
    end
    are
  end

  def set(key, value)
    @values.push([key, value])
  end

  def size
    @values.size
  end

  def each(&block)
    @values.each(&block)
  end

  def clear
    @values = []
  end
end
