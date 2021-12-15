# frozen_string_literal: true

# This class implements the HashClass
class MyHash
  include Enumerable

  INIT_SIZE = 10

  def initialize
    @entry_count = 0
    @bin_count   = INIT_SIZE
    @arr = Array.new(@bin_count) { [] }
  end

  def index_of(key)
    key.hash % @bin_count
  end

  def each(&block)
    @arr.each(&block)
  end

  def find(key)
    bin_for(key).find do |entry|
      key == entry.first
    end
  end

  def [](key)
    find(key).last
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

  def delete_by_key(key)
    bin_for(key).clear
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

  private

  def grow
    @bin_count = @bin_count << 1

    new_arr = Array.new(@bin_count) { [] }

    @arr.flatten(1).each do |entry|
      new_arr[index_of(entry.first)] << entry
    end

    @arr = new_arr
  end

  def full?
    @entry_count > INIT_SIZE * @bin_count
  end

  def bin_for(key)
    @arr[index_of(key)]
  end
end
