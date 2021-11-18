# frozen_string_literal: true

# this class is my realisation of Hash
class MyHash
  include Enumerable

  def initialize
    @dictionary = []
  end

  def [](key)
    pair(key)[1]
  end

  def []=(key, value)
    if self[key]
      value.find { |k, _v| k == key }[1] = value
    else
      @dictionary.push([key, value])
    end
  end

  def delete(key)
    @dictionary.delete(pair(key))
  end

  def delete_all
    @dictionary.clear
  end

  def size
    @dictionary.size
  end

  def pair(key)
    @dictionary.find { |k, _| k == key } || []
  end

  def each(&block)
    @dictionary.each(&block)
  end
end
