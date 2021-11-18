# frozen_string_literal: true

# Hash class extension created
class MyHash
  include Enumerable
  attr_reader :customhash

  def initialize
    @customhash = []
  end

  def [](key)
    @customhash[key]
  end

  def []=(key, value)
    @customhash.push([key, value])
  end

  def delete(key)
    @customhash.delete(pair(key))
  end

  def clear
    @customhash.clear
  end

  def size
    @customhash.size
  end

  def each(&block)
    @customhash.each(&block)
  end
end
