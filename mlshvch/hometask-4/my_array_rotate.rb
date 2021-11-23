#!/usr/bin/env ruby

# frozen_string_literal: true

# class Array is extended with methods lab_rotate and lab_rotate! methods
# with the Array.rotate and Array.rotate! functionality respectively
class Array
  def lab_rotate(shift = 1)
    return self if shift.zero?

    shift = adjust_array_shift(shift, length)
    if shift.positive?
      self[shift..(length - 1)] + self[0..(shift - 1)]
    else
      self[shift..] + self[0..(length + shift - 1)]
    end
  end

  def lab_rotate!(shift = 1)
    replace(lab_rotate(shift))
  end

  private

  def adjust_array_shift(shift, array_length)
    shift.positive? ? shift % array_length : -(-shift % array_length)
  end
end
