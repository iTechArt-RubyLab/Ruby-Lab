# frozen_string_literal: true

# the module
class MyHash
  prepend Enumerable

  def initialize
    @arr = []
  end

  def [](key)
    find_in_array(key)[1]
  end

  def []=(key, value)
    indicator = find_in_array(key)
    indicator == [] ? @arr.push([key, value]) : indicator[1] = value
  end

  def find_in_array(key)
    @arr.find { |findkey, _value| findkey == key } || []
  end

  def clear
    @arr.clear
  end

  def size
    @arr.size
  end

  def each(&block)
    @arr.each(&block)
  end

  def delete(key)
    @arr.delete(find_in_array(key))
  end
end

h = MyHash.new
h['key1'] = 'value1'
h['key1'] = 'value3'
h['key13'] = 'value1'
h['key13'] = 'value4'
puts h['key13']
h.each { |k, v| puts "#{k} => #{v}" }
# h.inspect
# h.arr.each {|k, v| print "{#{k} => #{v}}" }
# h['key1'] = 'value2'
# print "#{h.arr}\n"
# h['key2'] = 'value2'
# print "#{h.arr}\n"
# puts h.size
#
# h.arr.each do |k,v|
#   print "{#{k} => #{v}}"
# end
#
#  h['key3'] = 'value3'
# print "#{h.arr}\n"
#
# h.delete_key('key2')
# print "#{h.arr}\n"
# #
# h.delete_key_and_value
# print "#{h.arr}\n"
