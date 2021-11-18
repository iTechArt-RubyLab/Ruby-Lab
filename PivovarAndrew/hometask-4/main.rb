# !/usr/bin/env ruby
# frozen_string_literal: true

require './model/my_hash'
require './model/my_array_rotate'

# Main class
class Main
  MIN_VALUE_ARRAY_ELEMENT = 1
  MAX_VALUE_ARRAY_ELEMENT = 9
  ROTATES_COUNT = -4
  ARRAY_OUTPUT_SEPARATOR = ', '

  def run_cli
    run_task_one
    run_task_two
  end

  private

  def run_task_one
    array = (MIN_VALUE_ARRAY_ELEMENT..MAX_VALUE_ARRAY_ELEMENT).to_a
    puts "Initial array: #{array.join(ARRAY_OUTPUT_SEPARATOR)}"
    array.lab_rotate
    puts "Array after 'lab rotate': #{array.join(ARRAY_OUTPUT_SEPARATOR)}"
    array.lab_rotate!(-4)
    puts "Array after 'lab rotate!': #{array.join(ARRAY_OUTPUT_SEPARATOR)}"
  end

  def run_task_two
    my_hash = MyHash.new
    my_hash['abc'] = 123
    my_hash['bva'] = 57
    my_hash['daf'] = 9212
    puts my_hash
    my_hash['daf'] = 1234
    my_hash['abc'] = 'foo'
    puts my_hash
    my_hash.remove('abc')
    puts my_hash
  end
end

Main.new.run_cli
