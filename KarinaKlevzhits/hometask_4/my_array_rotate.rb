# frozen_string_literal: true

# Top-level comment
class Array
  def lab_rotate!(x_coord = 1)
    base_rotate(self, x_coord)
  end

  def lab_rotate(x_coord = 1)
    arr = clone
    base_rotate(arr, x_coord)
  end

  private

  def base_rotate(arr, x_coord = 1)
    steps = x_coord.abs % arr.size
    if x_coord.negative?
      steps.times { arr.unshift(arr.pop) }
    else
      steps.times { arr.push(arr.shift) }
    end
    arr
  end
end
