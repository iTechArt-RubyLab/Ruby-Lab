# frozen_string_literal: true

require 'objspace'

# Implementation of the MyHash class of task 4.2
class MyHash
  attr_reader :myhash

  include Enumerable

  def initialize
    @myhash = []
  end

  def [](key)
    get(key)[1]
  end

  def []=(key, value)
    @myhash.push([key, value])
  end

  def delete(key)
    @myhash.delete(get(key))
  end

  def clear
    @myhash = reject { |value| value }
  end

  def get(key)
    @myhash.find { |item, _| item == key } || []
  end

  def memory_size
    ObjectSpace.memsize_of(@myhash)
  end

  def length
    @myhash.count
  end

  def each(&block)
    @myhash.each(&block)
    self
  end
end
