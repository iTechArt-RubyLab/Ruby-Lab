# frozen_string_literal: true

# This class implements the rotate method
class Array
  def lab_rotate!(n = 1)
    lab_rotate_logic(self, n)
  end

  def lab_rotate(n = 1)
    lab_rotate_logic(self.dup, n)
  end

  private

  def lab_rotate_logic(arr, n)
    if n >= 0 
      n.times do
        arr.push(arr.shift)
      end
    else 
      (n * -1).times do
        arr.unshift(arr.pop)
      end
    end
    arr
  end
end
