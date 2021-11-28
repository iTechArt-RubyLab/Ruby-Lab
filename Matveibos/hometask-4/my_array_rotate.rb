# frozen_string_literal: true

# the module extends the class Array
module LabArrayRotate
  def lab_rotate(num = -1)
    moving(clone, num)
  end

  def lab_rotate!(num = -1)
    replace moving(self, num)
  end

  def moving(arr, num)
    separator = -num % arr.size
    if separator.zero?
      self
    else
      section1 = arr[0..separator - 1]
      section2 = arr[separator..arr.size]
      section2 + section1
    end
  end
end

# this class Array is ordered
class Array
  prepend LabArrayRotate
end
