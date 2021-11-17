#!/usr/bin/env ruby
# frozen_string_literal: true

# Extension for native class Array
class Array
  def lab_rotate(shift = 1)
    check_before_rotate(self, shift)
  end

  def lab_rotate!(shift = 1)
    new_order = check_before_rotate(self, shift)
    each_index do |i|
      self[i] = new_order[i]
    end
    self
  end

  private

  def check_before_rotate(array, shift)
    return [] if array.empty?
    return array if shift.zero?
    return array if shift >= array.size && (array.size % shift).zero?

    shift = shift % array.size if shift > array.size
    itself_rotate(array, shift)
  end

  def itself_rotate(array, shift)
    new_order = []
    start_point = shift.positive? ? shift : array.size + shift
    array[start_point...array.size].each { |n| new_order.push(n) }
    array[0...start_point].each { |n| new_order.push(n) }
    new_order
  end
end
