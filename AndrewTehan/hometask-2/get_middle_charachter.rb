def return_by_index(string, index)
  string[index]
end

def return_by_range(string, start_index, end_index)
  string[start_index..end_index]
end

def get_middle(string) 
  size = string.size
  middle_index = size / 2
  size.odd? ? return_by_index(string, middle_index) : return_by_range(string, middle_index - 1, middle_index)
end