# !/usr/bin/env ruby
# frozen_string_literal: true

# Custom Hash class
class MyHash
  include Enumerable

  # Custom key-value pair class
  class Item
    attr_reader :key
    attr_accessor :value

    def initialize(key, value)
      @key = key
      @value = value
    end

    def to_s
      "#{key} => #{value}"
    end
  end

  attr_reader :items

  NIL_KEY_MESSAGE = 'Key cannot be nil.'
  ITEMS_SEPARATOR = ', '
  HASH_COEF = 300

  def initialize
    @items = []
  end

  def each(&block)
    @items.each(&block)
  end

  def [](key)
    get(key)
  end

  def []=(key, value)
    add(key, value)
  end

  def ==(other)
    @items == other
  end

  def remove(key)
    items.delete(get(key))
  end

  def length
    items.compact.count
  end

  def clear
    items.clear
  end

  def contain_key?(key)
    items[calc_hash(key)] ? items[calc_hash(key)].key == key : false
  end

  private

  def to_s
    items.compact.map(&:to_s).join(ITEMS_SEPARATOR)
  end

  def get(key)
    raise_nill_key if key.nil?
    raise "Key #{key} doesnt exist in hash." unless contain_key?(key)

    items[calc_hash(key)]
  end

  def add(key, value)
    raise_nill_key if key.nil?
    contain_key?(key) ? get(key).value = value : items[calc_hash(key)] = Item.new(key, value)
  end

  def calc_hash(key)
    key.hash.abs / HASH_COEF
  end

  def raise_nill_key
    raise NIL_KEY_MESSAGE
  end

  private_constant :Item
end
