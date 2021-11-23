# frozen_string_literal: true

# this class is extension for Array
class Array
  def lab_rotate(offset = 1)
    shift = offset % size

    return self if shift.zero?

    first_chunk = self[0, shift]
    second_chunk = self[shift, size - 1]
    second_chunk.append(*first_chunk)
  end

  def lab_rotate!(offset = 1)
    replace(lab_rotate(offset))
  end
end
