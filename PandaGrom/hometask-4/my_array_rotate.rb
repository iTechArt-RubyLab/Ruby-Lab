# frozen_string_literal: true

# This class implements the rotate method
class Array
  def lab_rotate!(num = 1)
    lab_rotate_logic(self, num)
  end

  def lab_rotate(num = 1)
    lab_rotate_logic(dup, num)
  end

  private

  def lab_rotate_logic(arr, num)
    if num >= 0
      num.times do
        arr.push(arr.shift)
      end
    else
      (num * -1).times do
        arr.unshift(arr.pop)
      end
    end
    arr
  end
end
