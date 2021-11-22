# !/usr/bin/env ruby
# frozen_string_literal: true

# # realisation of Array
class Array
  def lab_rotate(shift = 1)
    movable_elements = self[0..shift - 1]
    rotate_array = self[shift..size - 1]
    rotate_array.push(movable_elements).flatten
  end

  def lab_rotate!(shift = 1)
    movable_elements = self[0..shift - 1]
    rotate_array = self[shift..size - 1]
    replace(rotate_array.push(movable_elements)).flatten
  end
end
