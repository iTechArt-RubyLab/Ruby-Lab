# frozen_string_literal: true

# Reading data
module DataReader
  def read_file(file)
    File.open(file).read
  end
end
