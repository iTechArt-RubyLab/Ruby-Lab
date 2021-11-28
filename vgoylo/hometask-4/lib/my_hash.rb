# frozen_string_literal: true

require 'pry'

# the class implements Hash behavior
class MyHash
  attr_accessor :array
  attr_reader :count

  def initialize
    @size = 10
    @array = Array.new(@size) { [] }
    @count = 0
  end

  def []=(key, value)
    slot = h(key)
    arr = @array[slot]
    key_value_pr = arr.find { |pair| pair[0] == key }
    if key_value_pr
      key_value_pr[1] = value
    else
      @count += 1
      arr << [key, value]
    end
  end

  def [](key)
    slot = h(key)
    arr = @array[slot]
    key_value_pr = arr.find do |pair|
      pair[0] == key
    end
    key_value_pr[1] if key_value_pr
  end

  def remove(key)
    value = self[key]
    @array.each do |element|
      element.delete([key, value]) if element.include?([key, value])
    end

    @count -= 1
  end

  def clean
    @array = Array.new(@size) { [] }
    @count = 0
  end

  private

  def h(key)
    key.hash % @size
  end
end
