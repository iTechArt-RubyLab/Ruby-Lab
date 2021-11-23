# frozen_string_literal: true

require 'pry'

# the class contains methods for working with arrays
class Array
  def lab_rotate(num = 1)
    copy = dup
    num.abs.times do
      if num > -1
        copy.push(copy.shift)
      else
        copy.unshift(copy.pop)
      end
    end
    copy
  end

  def lab_rotate!(num = 1)
    self[0..-1] = lab_rotate(num)
  end
end
