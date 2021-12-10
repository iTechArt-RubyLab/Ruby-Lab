# frozen_string_literal: true

# Converting data
class DataConverter
  REGULAR_EXPRESSION = /\d+.\d+/.freeze

  def values_recorder(town, data)
    town_line = data.split("\n").select { |value| value.split(':')[0] == town }.join
    -1.0 if town_line.empty?
    town_line.scan(REGULAR_EXPRESSION).map(&:to_f)
  end
end
