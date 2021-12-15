# frozen_string_literal: true

# Module rotating
module MyLabRotate
  def lab_rotate(step = 1)
    shift_array = step % size
    shift_array.zero? ? self : last(size - shift_array) + first(shift_array)
  end

  def lab_rotate!(step = 1)
    shift_array = step % size
    shift_array.zero? ? self : replace(last(size - shift_array) + first(shift_array))
  end
end
