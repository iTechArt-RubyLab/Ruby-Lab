# frozen_string_literal: true

# This class implements the lab_rotate, lab_rotate! methods
class Array
  def lab_rotate!(num = 1)
    lab_rotate_logic(self, num)
  end

  def lab_rotate(num = 1)
    lab_rotate_logic(dup, num)
  end

  private

  def lab_rotate_logic(arr, num)
    shift_size = num.abs % arr.size
    return arr if shift_size.zero?

    if num.positive?
      arr.concat(arr.shift(shift_size))
    else
      arr.unshift(arr.slice!(-shift_size, shift_size)).flatten
    end
  end
end
