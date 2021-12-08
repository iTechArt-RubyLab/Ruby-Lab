# frozen_string_literal: true

class GetMiddleCharacter
  def initialize(str)
    @str = str
  end

  def result_of_middle
    str.length.odd? ? str[middle] : twice_middle_character
  end

  private

  attr_reader :str

  def middle
    str.length / 2
  end

  def twice_middle_character
    str[(middle - 1)..middle]
  end
end
