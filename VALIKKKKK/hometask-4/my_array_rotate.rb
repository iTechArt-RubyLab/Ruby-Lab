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
    if num.positive?
      positive_case(arr, num)
    else
      negative_case(arr, num)
    end
  end

  def positive_case(arr, num)
    if num > arr.size
      arr.concat(arr.shift(num - arr.size))
    else
      arr.concat(arr.shift(num))
    end
  end

  def negative_case(arr, num)
    if (-num) > arr.size
      arr.unshift(arr.slice!(arr.size + num, -num - arr.size)).flatten(1)
    else
      arr.unshift(arr.slice!(num, -num)).flatten(1)
    end
  end
end