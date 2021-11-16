# !/usr/bin/env ruby
# frozen_string_literal: true

# Array class extension
class Array
  def lab_rotate(rotate_qty = nil)
    # rotate_qty.negative? ? push(shift) : unshift(pop)
    rotate_qty -= length * (rotate_qty / length).floor
    push(slice!(0, rotate_qty))
  end

  def lab_rotate!(rotate_qty); end
end

MIN_VALUE_ARRAY_ELEMENT = 1
MAX_VALUE_ARRAY_ELEMENT = 9
ROTATES_COUNT = 4

array = (MIN_VALUE_ARRAY_ELEMENT..MAX_VALUE_ARRAY_ELEMENT).to_a
array.lab_rotate(4)
array.flatten!
print array.join(', ')
