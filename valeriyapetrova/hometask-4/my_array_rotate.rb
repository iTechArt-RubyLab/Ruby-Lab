#!/usr/bin/env ruby

# frozen_string_literal: true

# looks like an array
class MyArray
  def initialize; end

  def user_input
    puts 'Enter an array: '
    @input_array = gets.chomp
    puts 'Enter a num: '
    @input_num = gets.chomp.to_i
  end

  def make_array
    user_input

    @num_of_shifts = @input_num.to_i
    @cycle_array = @input_array.split(',')
  end

  def lab_rotate
    make_array

    if @num_of_shifts >= 1
      new_array = @cycle_array.push(@cycle_array.shift(@num_of_shifts)).flatten
      p new_array

    elsif @num_of_shifts < 1 then @num_of_shifts *= -1

                                  @num_of_shifts.times { @cycle_array.unshift(@cycle_array.pop) }
                                  p @cycle_array
    elsif @num_of_shifts / @num_of_shifts = 1 || 0
      p @cycle_array
    end
  end

  def lab_rotate!; end
end

a = MyArray.new
a.lab_rotate
