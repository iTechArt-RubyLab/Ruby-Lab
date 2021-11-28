#!/usr/bin/env ruby

# frozen_string_literal: true

# class My Hash task 4.2
class MyHash
    include Enumerable
  
    def initialize
      @keys = []
    end
  
    def [](key)
      pair(key)[1]
    end
  
    def []=(key, value)
      @keys.push([key, value])
    end
  
    def pair(key)
      @keys.find { |key_value| key_value == key } || []
    end
  
    def delete(key)
      @keys.delete(pair(key))
    end
  
    def clear
      @keys.clear
    end
  
    def size
      @keys.size
    end
  
    def each(&block)
      @keys.each(&block)
    end
  end
  