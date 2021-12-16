# frozen_string_literal: true

# Top-level comment
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

  private

  def find(key)
    @hash.find { |keys, _value| keys == key } or []
  end
end
