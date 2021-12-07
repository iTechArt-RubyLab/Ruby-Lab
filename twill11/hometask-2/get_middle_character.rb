# frozen_string_literal: true

# Get middle
class GetMiddleCharacter
  def initialize(str)
    @str = str
  end

  def result_of_middle
    @str.length.odd? ? @str[middle] : @str[(middle - 1)..middle]
  end
  
  private 
  
  def middle
    @str.length / 2
  end
end
