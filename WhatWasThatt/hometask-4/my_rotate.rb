# frozen_string_literal: true

# Module to include the methords to Array class
module MyRotate
  def lab_rotate(shift = 1)
    lab_rotate!(dup, shift)
  end

  def lab_rotate!(shift = 1)
    shift >= 0 ? left_shift(self, shift) : right_shift(self, shift)
  end

  private

  def left_shift(arr, shift)
    while shift >= 1
      arr.push(arr.shift)
      shift -= 1
    end
    arr
  end

  def right_shift(arr, shift)
    while shift.abs >= 1
      arr.unshift(arr.pop)
      shift -= 1
    end
    arr
  end
end
