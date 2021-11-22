# !/usr/bin/env ruby

# frozen_string_literal: true

# Custom Array methods
class Array
  def lab_rotate(shift = 1)
    shift %= length
    first_part = self[0..shift - 1]
    second_part = self[shift..length - 1]
    second_part.append(first_part).flatten
  end

  def lab_rotate!(shift = 1)
    shift %= length
    first_part = self[0..shift - 1]
    second_part = self[shift..length - 1]
    replace(second_part.append(first_part).flatten)
  end
end
