#!/usr/bin/env ruby
# frozen_string_literal: true

# realisation of Hash
class MyHash
  attr_accessor :myhash

  include Enumerable

  def initialize
    @hash = []
  end

  def [](key)
    myhash(key)
  end

  def []=(key, value)
    @hash.push([key, value])
  end

  def clear
    @hash = []
  end

  def delete(key)
    @hash = reject { |value| value.include? key }
  end

  def length
    @hash.length
  end

  def each(&block)
    @hash.each(&block)
  end
end
