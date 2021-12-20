# frozen_string_literal: true

# Class to implement my methods for hash
class MyHash
  include Enumerable

  def initialize
    @max_density = 5
    @entry_count = 0
    @bin_count = STARTING_BINS
    @table = Array.new(@bin_count) { [] }
  end

  def [](key)
    find(key).last
  rescue StandardError
    ''
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

  def delete(key)
    bin_for(key).delete_if { |entry| entry.first == key }
    @entry_count -= 1
  end

  def length
    @entry_count
  end

  def clear
    initialize
  end

  private

  STARTING_BINS = 16

  attr_accessor :table

  def grow
    @bin_count = @bin_count << 1
    new_table = Array.new(@bin_count) { [] }
    @table.flatten(1).each do |entry|
      new_table[index_of(entry.first)] << entry
    end
    @table = new_table
  end

  def full?
    @entry_count > @max_density * @bin_count
  end

  def bin_for(key)
    @table[index_of(key)]
  end

  def index_of(key)
    key.hash % @bin_count
  end

  def find(key)
    bin_for(key).find do |entry|
      key == entry.first
    end
  end
end
