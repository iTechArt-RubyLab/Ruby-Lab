# frozen_string_literal: true

require 'benchmark'

# the module
class MyHash
  prepend Enumerable

  def initialize
    @arr = []
  end

  def [](key)
    ident = key.hash % 1_000_000
    ident.negative? ? ident *= -1 : ident
    @arr[ident]
  end

  def []=(key, value)
    ident = key.hash % 1_000_000
    puts ident
    ident.negative? ? ident *= -1 : ident
    puts ident
    if @arr[ident].nil?
      @arr[ident] = [key, value]
    else
      @arr[ident][0] == key ? @arr[ident] = [key, value] : colizion(key, value, ident)
    end
  end

  def colizion(key, value, ident)
    ident += 1
    @arr[ident].nil? ? (@arr[ident] = [key, value]) : colizion(key, value, ident)
  end

  # def find_in_array(key)
  #   @arr.find { |findkey, _value| findkey == key } || []
  # end

  def clear
    @arr.clear
  end

  def size
    @arr.size
  end

  def each(&block)
    @arr.each(&block)
  end

  def delete(key)
    @arr.delete(find_in_array(key))
  end
end
