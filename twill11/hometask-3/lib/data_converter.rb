# frozen_string_literal: true

# Converting data
module DataConverter
  REGULAR_EXPRESSION = /\d+.\d+/.freeze

  def values_recorder(town, data)
    town_line = data.split("\n").find { |row| find_town(row) == town }.to_s
    town_line.scan(REGULAR_EXPRESSION).map(&:to_f)
  end

  def find_town(row)
    row.split(':').first
  end
end
