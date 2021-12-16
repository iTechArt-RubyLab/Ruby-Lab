# frozen_string_literal: true

# Implementation of my own hash
class MyHash
  include Enumerable

  START_BINARY = 16

  def initialize
    @max_size = 5
    @entry_count = 0
    @count_of_binary = START_BINARY
    @hash = Array.new(@count_of_binary) { [] }
  end

  def [](key)
    find(key)&.last
  end

  def []=(key, value)
    if find(key)
      find(key)[1] = value
    else
      grow if full?

      binary(key) << [key, value]
      @entry_count += 1
    end
  end

  def delete(key)
    binary(key).delete_if { |entry| entry.first == key }
    @entry_count -= 1
  end

  def size
    entry_count
  end

  def clear
    initialize
  end

  private

  attr_accessor :hash, :entry_count

  def grow
    @count_of_binary = @count_of_binary << 1
    temp_hash = Array.new(@count_of_binary) { [] }
    @hash.flatten(1).each do |entry|
      temp_hash[index(entry.first)] << entry
    end
    @hash = temp_hash
  end

  def full?
    entry_count > @max_size * @count_of_binary
  end

  def binary(key)
    hash[index(key)]
  end

  def index(key)
    key.hash % @count_of_binary
  end

  def find(key)
    binary(key).find { |entry| key == entry.first }
  end
end
