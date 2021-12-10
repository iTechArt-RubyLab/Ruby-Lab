# frozen_string_literal: true

# Reading data
class DataReader
  def read_file(file)
    File.open(file).read
  end
end
