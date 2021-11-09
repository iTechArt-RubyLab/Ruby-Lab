# frozen_string_literal: true

def get_middle(string)
  len = string.length
  mid = len / 2
  len.even? == true ? string[mid - 1, mid] : string[mid]
end
