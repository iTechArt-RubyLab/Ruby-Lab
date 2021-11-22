# frozen_string_literal: true

# this module contains math functions for calculating the average and variance
module MathFunctions
  def calculate_average(values)
    values.sum(&:to_f) / values.size
  end

  def calculate_variance(values)
    values.sum { |value| value**2 } / values.size
  end
end
