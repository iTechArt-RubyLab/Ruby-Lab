# frozen_string_literal: true

# Array class extension created
class Array
  def lab_rotate(displacement = 1)
    displacement = displacement % size
    # rubocop:disable Style/SlicingWithRange
    self[displacement..-1] + self[0...displacement]
    # rubocop:disable Style/SlicingWithRange
  end

  def lab_rotate!(displacement = 1)
    replace(lab_rotate(displacement))
  end
end
