#!/usr/bin/env ruby

# frozen_string_literal: true

# class Array is extended with methods lab_rotate and lab_rotate! methods
# with the Array.rotate and Array.rotate! functionality respectively
class Array

  def lab_rotate(shift = 1)
    @shift = shift.to_i % length
    if @shift.positive?
      self[@shift..(length - 1)] + self[0..(@shift - 1)]
    else
      self[@shift..(length + @shift)]
    end
  end

  def lab_rotate!(shift = 1)
    @shift = shift.to_i % length
    @shift = shift
    if @shift.positive?
      @shift.times { push(self[0]).delete_at(0) }
    else
      @shift *= -1
      @shift.times { unshift(self[-1]).delete_at(-1) }
    end
    self
  end
end
