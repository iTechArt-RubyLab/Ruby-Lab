#!/usr/bin/env ruby
# frozen_string_literal: true

# Array Implementation
class Array
  def lab_rotate(offset = 1)
    midpoint = offset % length
    if offset.zero? || (offset == length)
      self
    else
      num = length - midpoint
      last(num) + first(midpoint)
    end
  end

  def lab_rotate!(offset = 1)
    midpoint = offset % length
    if offset.zero? || (offset == length)
      self
    else
      num = length - midpoint
      replace(last(num) + first(midpoint))
    end
  end
end
