# frozen_string_literal: true

require 'benchmark'

# the module extends the class Array
module A
  def lab_rotate(num = -1)
    arr = clone
    separator = -num % arr.size
    if separator.zero?
      self
    else
      section1 = arr[0..separator - 1]
      section2 = arr[separator..arr.size]
      section2 + section1
    end
  end

  def lab_rotate!(num = -1)
    separator = -num % size
    if separator.zero?
      self
    else
      section1 = self[0..separator - 1]
      section2 = self[separator..size]
      replace(section2 + section1)
    end
  end
end

# this class Array is ordered
class Array
  prepend A
end
