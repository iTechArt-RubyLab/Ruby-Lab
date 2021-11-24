#!/usr/bin/env ruby
# frozen_string_literal: true

# Extension for native class Array
class Array
  def lab_rotate(shift = 1)
    return self unless need_to_rotate?(self, shift)

    itself_rotate(self, shift)
  end

  def lab_rotate!(shift = 1)
    return self unless need_to_rotate?(self, shift)

    replace(itself_rotate(self, shift))
  end

  private

  def need_to_rotate?(array, shift)
    return false if array.empty? || array.size == 1
    return false if shift.zero?
    return false if shift.abs >= array.size && (shift.abs % array.size).zero?

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
