#!/usr/bin/env ruby
# frozen_string_literal: true

# Hash Implementation
class Node
  attr_accessor :key, :value, :next, :prev

  def initialize(key, value, following = nil, prev = nil)
    @key = key
    @value = value
    @next = following
    @prev = prev
  end
end

# Hash Implementation
class LinkedList
  include Enumerable # Include the enumerable class to implement an each method for the list.
  attr_accessor :head # Represents the start of the list.

  # Initialize methods, defines the @head of the list to nil
  def initialize
    @head = nil
  end

  # Return whether or not the list is empty
  def is_empty?
    @head.nil?
  end

  # Return whether or not a specific key is present inside the list
  def include?(key)
    return false if is_empty?
    return true if @head.key == key

    current = @head
    until current.next.nil?
      current = current.next
      return true if current.key == key
    end
    false
  end

  # Insert a new node into the list by passing a key and a value
  #
  # @example
  # key = "john"
  # value = {"name" => "john", "age" => 33}
  # list = LinkedList.new
  # list.insert(key, value)
  def insert(key, val)
    return @head = Node.new(key, val) if is_empty?

    current = last_node
    current.next = Node.new(key, val, nil, current)
  end

  # Insert a new node at the begining of the list by passing a key and a value
  def insert_first(key, val)
    new_node = Node.new(key, val, @head)
    new_node.next.prev = new_node
    @head = new_node
  end

  # Delete a node from the list by passing the key
  def delete(key)
    return if is_empty? || !include?(key)

    remove_head if @head.key == key
    last_node do |current|
      delete_key(current) if current.key == key
    end
  end

  # Delete the first node from the list
  def delete_first
    remove_head
  end

  # Delete the last node from the list
  def delete_last
    last = last_node
    delete_key(last)
  end

  # Return the value of a node by giving the key
  def get(key)
    return nil if is_empty? || !include?(key)
    return @head.val if @head.key == key

    current = @head
    until current.next.nil?
      current = current.next
      return current.val if current.key == key
    end
  end

  # Return the value of the last node
  def last
    last_node.val
  end

  # Return the value of the first node
  def first
    is_empty? ? nil : @head.val
  end

  # Return the size of the list
  def size
    return 0 if is_empty?

    current = @head
    count = 0
    until current.next.nil?
      current = current.next
      count += 1
    end
    count
  end

  # Each method for a LinkedList
  def each
    return if is_empty?

    yield(head) if defined?(yield)
    current = @head
    until current.next.nil?
      current = current.next
      yield(current) if defined?(yield)
    end
  end

  private

  # Removes the head of the list
  def remove_head(_key)
    val = @head.val
    @head = @head.next
    @head.prev = nil if @head
    val
  end

  # Returns the last node in the list and executes a block if given
  def last_node
    return if is_empty?

    current = @head
    until current.next.nil?
      current = current.next
      yield(current) if defined?(yield)
    end
    current
  end

  # Deletes a specific node from the list
  def delete_key(current)
    prev = current.prev
    prev.next = current.next
    current.next&.prev = prev
    current.prev = nil
    current.next = nil
  end
end

# Hash Implementation
class HashMap
  attr_accessor :capacity, :buckets, :size, :collitions

  include Enumerable # Include the enumerable class to implement each method.
  # Initialize the HashMap with a fix capacity, fill in the buckets and start with size and collitions being cero.
  def initialize
    @capacity = 5
    @buckets = Array.new(@capacity) { LinkedList.new }
    @size = 0
    @collitions = 0
  end

  # Return whether or not the HashMap is empty
  def is_empty?
    @size.zero?
  end

  # Insert a new element into the HashMap, if the size and capacity are the same it first double the capacity and try to insert again.
  def []=(key, val)
    if @size == @capacity
      rehash
      insert(key, val)
    else
      index = get_bucket_index(key)
      @collitions += 1 unless @buckets[index].is_empty?
      @buckets[index].insert(key, val)
      @size += 1
    end
  end

  # Return the value of a specific key
  def [](key)
    return nil if is_empty?
    @buckets[get_bucket_index(key)].get(key)
  end

  # Remove an element form the HashMap by giving the key
  def remove(key)
    return nil if is_empty?

    @buckets[get_bucket_index(key)].delete(key)
    @collitions -= 1 if @buckets[get_bucket_index(key)].size <= 1
    @size -= 1
  end

  # Return whether or not the HashMap include a value by providing a key
  def include?(key)
    return false if is_empty?

    @buckets[get_bucket_index(key)].include?(key)
  end

  # Each method for a HashMap
  def each
    return if is_empty?

    @buckets.each do |bucket|
      current = bucket.head
      next unless current

      bucket.each do |node|
        yield(node) if defined?(yield)
      end
    end
  end

  private

  # Return the index for a specific key
  def get_bucket_index(key)
    hash(key) % capacity
  end

  # Calculate the has_code for a given key
  def hash(key)
    key = "#{key}#{key.class}"
    hash_code = 0

    (0..key.size - 1).each do |i|
      hash_code += key[i].ord
    end
    hash_code += ((key.bytes.inject(:+) + key.bytesize))
  end

  # Recalculate the capacity of the HashMap and reinsert the current elements into their corresponding new index inside the array
  def rehash
    @capacity *= 2
    @collitions = 0
    rehash_buckets = Array.new(@collitions) { LinkedList.new }
    rehash_insert = ->(index, current) { rehash_buckets[index].insert(current.key, current.val) }
    @buckets.each do |bucket|
      current = bucket.head
      next unless current

      index = get_bucket_index(current.key)
      collitions += 1 unless rehash_buckets[get_bucket_index(current.key)].is_empty?
      rehash_insert.call(get_bucket_index(current.key), current)
      until current.next.nil?
        current = current.next
        collitions += 1 unless rehash_buckets[get_bucket_index(current.key)].is_empty?
        rehash_insert.call(get_bucket_index(current.key), current)
      end
    end
    @buckets = rehash_buckets
  end
end

