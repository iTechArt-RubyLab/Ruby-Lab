#!/usr/bin/env ruby

# frozen_string_literal: true

# class Array is extended with methods lab_rotate and lab_rotate! methods
# with the Array.rotate and Array.rotate! functionality respectively
class Array
  def adjust_array_shift(shift, array_length)
    if shift.positive?
      shift % array_length
    else
      -(-shift % array_length)
    end
  end

  def lab_rotate(shift = 1)
    return self if shift.zero?

    shift = adjust_array_shift(shift, length)
    if shift.positive?
      # method Array#append is not used because of Rubocop Assignment Condition Size Branch is too high
      self[shift..(length - 1)] + self[0..(shift - 1)]
    else
      self[shift..] + self[0..(length + shift - 1)]
    end
  end

  def lab_rotate!(shift = 1)
    replace(lab_rotate(shift))
  end
end
