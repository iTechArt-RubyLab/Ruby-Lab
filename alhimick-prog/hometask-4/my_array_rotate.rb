#!/usr/bin/env ruby
# frozen_string_literal: true

class Array

  def lab_rotate(n=1)
    itself_rotate(self, n)
  end

  def lab_rotate!(n=1)
    new_order = itself_rotate(self, n)
    puts "New order: #{new_order}"
    i = 0
    self.each_with_index do |i, v|
      self[i] = new_order[i]
    end
    #itself_rotate(self, n)
    #self << 0
    #self << 1
    puts "#{self}"
    self
  end

  private

  def itself_rotate(array, n)
    return [] if array.empty?
    return array if n.zero?
    return array if array.size % n == 0
    array = (1..10).to_a
    #puts "Array rotate to #{n} move to #{array}"
    array
  end

end

arr = [1, 2, 3, 4, 5, 6, 7]
#arr = []
puts "Start arr: #{arr}"
puts "ID: #{arr.object_id}\n"
puts "Rotate(): #{arr.lab_rotate}"
puts "After: #{arr}"
puts "ID: #{arr.object_id}\n"
puts "Rotate(10): #{arr.lab_rotate(10)}"
puts "After: #{arr}"
puts "#{arr.object_id}\n"
puts "Rotate!(): #{arr.lab_rotate!}"
puts "After: #{arr}"
puts "#{arr.object_id}\n"
