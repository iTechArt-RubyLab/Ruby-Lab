#!/usr/bin/env ruby
# frozen_string_literal: true

# class implementation
class Array
  def lab_rotate(value = 1)
    shift = value % length
    return self if shift.zero?

    last(length - shift) + first(shift)
  end

  def lab_rotate!(value = 1)
    shift = value % length
    return self if shift.zero?

    replace(lab_rotate(value))
  end
end
