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
    myhash[key]
  end

  def []=(key, value)
    @myhash.push([key, value])
  end

  def delete(key)
   @myhash=self.reject {|value| value.include? key }
   return @myhash
  end

  def clear
    @myhash= self.reject { |el| el}
    return @myhash
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
