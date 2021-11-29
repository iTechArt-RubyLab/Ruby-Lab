# frozen_string_literal: true

# This class implements the HashClass
class MyHash
  include Enumerable
  attr_accessor :arr

  def initialize
    @max_density = 10
    @entry_count = 0
    @bin_count   = 10
    @arr = Array.new(@bin_count) { [] }
  end

  def grow
    @bin_count = @bin_count << 1

    new_arr = Array.new(@bin_count) { [] }

    @arr.flatten(1).each do |entry|
      new_arr[index_of(entry.first)] << entry
    end

    @arr = new_arr
  end

  def full?
    @entry_count > @max_density * @bin_count
  end

  def [](key)
    find(key).last
  end

  def find(key)
    bin_for(key).find do |entry|
      key == entry.first
    end
  end

  def bin_for(key)
    @arr[index_of(key)]
  end

  def index_of(key)
    key.hash % @bin_count
  end

  def []=(key, value)
    entry = find(key)

    if entry
      entry[1] = value
    else
      grow if full?

      bin_for(key) << [key, value]
      @entry_count += 1
    end
  end

  def each(&block)
    @arr.each(&block)
  end

  def delete_all
    @arr.clear
  end

  def size
    @entry_count
  end

  def array
    @arr.flatten
  end
end
