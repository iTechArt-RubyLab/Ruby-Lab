#!/usr/bin/env ruby

# frozen_string_literal: true

# Array with my rotate Task 4.1
class Array
  def lab_rotate(value = 1)
    my_shift = value % size

    if my_shift.zero?
      self
    else
      last(size - my_shift) + first(my_shift)
    end
  end

  def lab_rotate!(value = 1)
    my_shift = value % size
    if my_shift.zero?
      self
    else
      my_shift.times do |_step|
        push(shift)
      end
    end
  end
end
