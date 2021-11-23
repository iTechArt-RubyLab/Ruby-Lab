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
  INITIAL_SIZE = 50
  FULNESS_COEF = 0.5

  def initialize
    @size = INITIAL_SIZE
    @items = Array.new(INITIAL_SIZE)
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
    items[get_position(key)] ? items[get_position(key)].key == key : false
  end

  private

  def to_s
    items.compact.map(&:to_s).join(ITEMS_SEPARATOR)
  end

  def get(key)
    raise_nill_key if key.nil?
    raise "Key #{key} doesnt exist in hash." unless contain_key?(key)

    items[get_position(key)]
  end

  def add(key, value)
    raise_nill_key if key.nil?
    resize if length.to_f / @size > FULNESS_COEF
    contain_key?(key) ? get(key).value = value : items[get_position(key)] = Item.new(key, value)
  end

  def get_position(key)
    key.hash % @size
  end

  def resize
    @size *= 2
    new_items = Array.new(@size)
    items.compact.each do |item|
      new_items[get_position(item.key)] = Item.new(item.key, item.value)
    end
    @items = new_items
  end

  def raise_nill_key
    raise NIL_KEY_MESSAGE
  end

  private_constant :Item
end
