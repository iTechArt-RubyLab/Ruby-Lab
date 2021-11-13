# frozen_string_literal: true

def get_middle(string)
  middle_string_position = string.length / 2
  string.length.even? ? string[(middle_string_position - 1)..middle_string_position] : string[middle_string_position]
end
