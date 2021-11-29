# frozen_string_literal: true

# Array class extension created
class Array
  def lab_rotate(displacement = 1)
    displacement = displacement % size
    self[displacement..] + self[0...displacement]
  end

  def lab_rotate!(displacement = 1)
    replace(lab_rotate(displacement))
  end
end
