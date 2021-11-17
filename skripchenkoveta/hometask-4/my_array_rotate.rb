# frozen_string_literal: true

class Array
  def lab_rotate(value = 1)
    step = value % length
    return self unless step != length

    last(length - step) + first(step)
  end

  def lab_rotate!(value = 1)
    step = value % length
    return self unless step != length

    step.times do |_i|
      push(shift)
    end
    self
  end
end
