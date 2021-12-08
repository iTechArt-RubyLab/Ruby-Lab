# frozen_string_literal: true

# Calculate middle character
class GetMiddleCharacter
  def initialize(str)
    @str = str
  end

  def result_of_middle
    str[middle_range]
  end

  private

  attr_reader :str

  def size
    @size ||= str.size
  end

  def middle
    @middle ||= size / 2
  end

  def middle_range
    size.odd? ? middle : (middle - 1)..middle
  end
end
