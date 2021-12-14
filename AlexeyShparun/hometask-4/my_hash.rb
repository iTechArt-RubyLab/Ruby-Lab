#!/usr/bin/env ruby

# frozen_string_literal: true

# My hash
class MyHash
  include Enumerable

  def initialize
    @hash = []
  end

  def add_value(key, value)
    @hash.push([key, value])
  end

  def find_key_value(key)
    @hash.find { |keys, _| keys == key }
  end

  def find_value(key)
    find_key_value(key).last
  end

  def delete(key)
    @hash.delete(find_key_value(key))
  end

  def clear
    @hash = []
  end

  def length
    @hash.length
  end

  def each(&block)
    @hash.each(&block)
  end
end
