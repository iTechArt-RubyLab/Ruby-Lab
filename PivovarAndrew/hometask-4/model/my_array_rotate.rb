# !/usr/bin/env ruby
# frozen_string_literal: true

# Array class extension
class Array
  DEFAULT_ROTATE_QTY = 1

  def lab_rotate(rotate_qty = nil)
    rotated_array = self.dup
    rotated_array.push(rotated_array.slice!(0, rotate_qty.nil? ? DEFAULT_ROTATE_QTY : calc_rotate_qty(rotate_qty)))
  end

  def lab_rotate!(rotate_qty = nil)
    push(slice!(0, rotate_qty.nil? ? DEFAULT_ROTATE_QTY : calc_rotate_qty(rotate_qty)))
  end

  private

  def calc_rotate_qty(rotate_qty)
    rotate_qty - length * (rotate_qty / length).floor
  end
end
