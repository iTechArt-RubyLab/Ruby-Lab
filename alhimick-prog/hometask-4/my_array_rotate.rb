#!/usr/bin/env ruby
# frozen_string_literal: true

class Array

  def lab_rotate(n=1)
    check_before_rotate(self, n)
  end

  def lab_rotate!(n=1)
    new_order = check_before_rotate(self, n)
    self.each_index do |i|
      self[i] = new_order[i]
    end
    self
  end

  private

  def check_before_rotate(array, n)
    return [] if array.empty?
    return array if n.zero?
    return array if n >= array.size && array.size % n == 0

    n = n % array.size if n > array.size
    itself_rotate(array, n)
  end

  def itself_rotate(array, n)
    new_order = []
    start_point = n > 0 ? n : array.size + n
    array[start_point...array.size].each { |n| new_order.push(n) }
    array[0...start_point].each { |n| new_order.push(n) }
    new_order
  end

end


=begin
arr = [1, 2, 3, 4, 5, 6, 7]
puts "Start arr: #{arr}"
puts "ID: #{arr.object_id}"
puts "Rotate(): #{arr.lab_rotate}"
puts "After: #{arr}"
puts "ID: #{arr.object_id}"
puts "Rotate(10): #{arr.lab_rotate(10)}"
puts "After: #{arr}"
puts "#{arr.object_id}"
puts "Rotate!(): #{arr.lab_rotate!}"
puts "After: #{arr}"
puts "#{arr.object_id}"
puts "Rotate!(-5): #{arr.lab_rotate!(-5)}"
puts "After: #{arr}"
puts "#{arr.object_id}"
=end
