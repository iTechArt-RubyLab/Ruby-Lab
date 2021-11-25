#!/usr/bin/env ruby
# frozen_string_literal: true

# this class is extension for Hash
class MyHash
  include Enumerable

  attr_reader :my_hash

  ONE = 1

  def initialize
    @my_hash = []
  end

  def [](input_key)
    pair(input_key)[ONE]
  end

  def []=(input_key, input_value)
    if self[input_key]
      @my_hash.find { |key, _value| key == input_key }[ONE] = input_value
    else
      @my_hash << [input_key, input_value]
    end
  end

  def size
    @my_hash.size
  end

  def delete(input_key)
    @my_hash.delete(pair(input_key))
  end

  def delete_all
    @my_hash.clear
  end

  def each(&block)
    @my_hash.each(&block)
  end

  private

  def pair(input_key)
    @my_hash.find { |key, _value| key == input_key } || []
  end
end
