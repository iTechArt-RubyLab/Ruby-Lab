# frozen_string_literal: true

# Custom rotate implementation
class Array
  def lab_rotate(shift = 1)
    movable_size = shift % size
    movable_part = self[0...movable_size]
    rest_part = self[movable_size..size - 1]
    rest_part.append(movable_part).flatten
  end

  def lab_rotate!(shift = 1)
    replace(lab_rotate(shift))
  end
end
