# frozen_string_literal: true

require 'benchmark'
require './my_hash'
require 'colorize'

@my_hash = MyHash.new
@hash = {}

print 'Enter the size of the array: '
@size = gets.chomp.to_i

# this class used for print benchmark results
class BenchmarkResultsPrinter
  attr_reader :class_name, :class_color

  def initialize(class_name:, class_color: :white)
    @class_name = class_name
    @class_color = class_color
  end

  def show_res(method:, metric_name:, metric_value:, metric_color: :white)
    show_metric_prefix(metric_name: metric_name.to_s, method: method)
    show_metric_value(metric_value: metric_value, metric_color: metric_color)
  end

  private

  def show_metric_prefix(metric_name:, method:)
    print "#{class_name.colorize(class_color)} #{method} #{metric_name}: "
  end

  def show_metric_value(metric_value:, metric_color:)
    puts metric_value.to_s.colorize(metric_color)
  end
end

Benchmark.bm do |x|
  my_hash_write = @size.times.map { |i| x.report(:my_hash_write) { @my_hash[i] = i }.real }

  my_hash_read = @size.times.map { |i| x.report(:my_hash_read) { @my_hash[i] }.real }

  hash_write = @size.times.map { |i| x.report(:hash_write) { @hash[i] = i }.real }

  hash_read = @size.times.map { |i| x.report(:hash_read) { @hash[i] }.real }

  my_hash_res = BenchmarkResultsPrinter.new(class_name: MyHash.to_s, class_color: :magenta)
  hash_res = BenchmarkResultsPrinter.new(class_name: Hash.to_s, class_color: :red)

  puts "Array size - #{@size}:"

  my_hash_res.show_res(method: '[]=', metric_name: :max, metric_color: :cyan, metric_value: my_hash_write.max)

  my_hash_res.show_res(method: '[]=', metric_name: :min, metric_color: :green, metric_value: my_hash_write.min)

  my_hash_res.show_res(method: '[]=', metric_name: :mean, metric_color: :blue, metric_value: my_hash_write.sum / @size)

  hash_res.show_res(method: '[]=', metric_name: :max, metric_color: :cyan, metric_value: hash_write.max)

  hash_res.show_res(method: '[]=', metric_name: :min, metric_color: :green, metric_value: hash_write.min)

  hash_res.show_res(method: '[]=', metric_name: :mean, metric_color: :blue, metric_value: hash_write.sum / @size)

  my_hash_res.show_res(method: '[]', metric_name: :max, metric_color: :cyan, metric_value: my_hash_read.max)

  my_hash_res.show_res(method: '[]', metric_name: :min, metric_color: :green, metric_value: my_hash_read.min)

  my_hash_res.show_res(method: '[]', metric_name: :mean, metric_color: :blue, metric_value: my_hash_read.sum / @size)

  hash_res.show_res(method: '[]', metric_name: :max, metric_color: :cyan, metric_value: hash_read.max)

  hash_res.show_res(method: '[]', metric_name: :min, metric_color: :green, metric_value: hash_read.min)

  hash_res.show_res(method: '[]', metric_name: :mean, metric_color: :blue, metric_value: hash_read.sum / @size)
end
