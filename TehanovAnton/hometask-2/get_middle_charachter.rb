# frozen_string_literal: true

def get_middle(string)
  half = string.size / 2
  string.length.odd? ? string[half] : string[(half - 1)..half]
end
