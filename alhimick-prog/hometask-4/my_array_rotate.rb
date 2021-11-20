#!/usr/bin/env ruby
# frozen_string_literal: true

# Extension for native class Array
class Array
  def lab_rotate(shift = 1)
    return self unless check_before_rotate(self, shift)

    itself_rotate(self, shift)
  end

  def lab_rotate!(shift = 1)
    return self unless check_before_rotate(self, shift)

    itself_rotate(self, shift).each_with_index do |val, ind|
      self[ind] = val
    end
    self
  end

  private

  def check_before_rotate(array, shift)
    return false if array.empty? || array.size == 1
    return false if shift.zero?

    shift_modulus = shift.positive? ? shift : -shift
    return false if shift_modulus >= array.size && (shift_modulus % array.size).zero?

    true
  end

  def itself_rotate(array, shift)
    shift_is_positive = shift.positive?
    shift = -shift unless shift_is_positive
    shift %= array.size
    start_point = shift_is_positive ? shift : array.size - shift
    array[start_point...array.size] + array[0...start_point]
  end
end
