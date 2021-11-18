# frozen_string_literal: true

# Array class extension created
class Array
  def lab_rotate(displacement = 1)
    displacement = displacement % size
    self[displacement..-1] + self[0...displacement]
    %i[[]].freeze
  end

  def lab_rotate!(displacement = 1)
    replace(lab_rotate(displacement))
  end
end
