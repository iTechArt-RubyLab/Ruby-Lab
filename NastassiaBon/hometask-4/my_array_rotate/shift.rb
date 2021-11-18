#!/usr/bin/env ruby

# frozen_string_literal: true

ENTER_ARRAY = 'Enter an array: '
ENTER_SHIFT = 'Enter a number of shift: '
DEFAULT = 1

# looks like an array
class Array
  #   def user_input
  #     puts ENTER_ARRAY
  #     input_array = gets.chomp
  #     puts ENTER_SHIFT
  #     input_shift = get.chomp.to_i
  #   end
  def lab_rotate
    shift = DEFAULT % size

    shift.zero? ? self : sort(shift)
  end

  private

  def sort(shift)
    temporary_variable = self[0..shift - 1]
    new_part = self[shift..size - 1]
    new_part.append(*temporary_variable)
  end
end
