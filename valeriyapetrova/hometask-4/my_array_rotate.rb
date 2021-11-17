#!/usr/bin/env ruby

# frozen_string_literal: true

# extending the Class Array with methods lab_rotate and lab_rotate!
class Array
  def lab_rotate(num_of_shifts = 1)
    return self if num_of_shifts.zero?

    self[num_of_shifts..-1] + self[0...num_of_shifts]
  end

  def lab_rotate!(num_of_shifts = 1)
    return self if num_of_shifts.zero?

    result = self[num_of_shifts..-1].concat(self[0...num_of_shifts])
    clear
    concat(result)
  end
end
