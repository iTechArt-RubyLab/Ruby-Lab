#!/usr/bin/env ruby
# frozen_string_literal: true

# realisation of Array
class Array
  def lab_rotate(slip = 1)
    midpoint = slip % length
    if slip.zero? || (slip == length)
      self
    else
      num = length - midpoint
      last(num) + first(midpoint)
    end
  end

  def lab_rotate!(slip = 1)
    midpoint = slip % length
    if slip.zero? || (slip == length)
      self
    else
      num = length - midpoint
      replace(last(num) + first(midpoint))
    end
  end
end
