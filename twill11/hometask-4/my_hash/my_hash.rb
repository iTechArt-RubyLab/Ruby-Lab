# frozen_string_literal: true

# Implementation of my own hash
class MyHash
  include Enumerable

  ONE = 1

  def initialize
    @hash_variable = []
  end

  def [](key)
    find(key)[ONE]
  end

  def []=(key, value)
    hash_variable << [key, value]
  end

  def find(key)
    hash_variable.find { |keys, _empty| keys == key } || []
  end

  def delete(key)
    hash_variable.delete(find(key))
  end

  def size
    hash_variable.size
  end

  def clear
    hash_variable.clear
  end

  def each(&block)
    hash_variable.each(&block)
  end

  private

  attr_accessor :hash_variable
end
