#!/usr/bin/env ruby
# frozen_string_literal: true

# realisation of Hash
class MyHash
  include Enumerable

  def initialize
    @hash = []
  end

  def [](key)
    find(key)[1]
  end

  def []=(key, value)
    @hash.push([key, value])
  end

  def find(key)
    @hash.find { |keys, _| keys == key } || []
  end

  def clear
    @hash = []
  end

  def delete(key)
    @hash.delete(find(key))
  end

  def length
    @hash.length
  end

  def each(&block)
    @hash.each(&block)
  end
end
