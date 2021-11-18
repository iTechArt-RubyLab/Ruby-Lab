class MyHashItem
  include Enumerable
  attr_accessor :key, :value

  def initialize(key:, value:)
    @key = key
    @value = value
  end

  def show
    "{#{key} => #{value}}"
  end
end

class MyHash
  attr_accessor :arr

  def initialize(arr = [])
    @arr = arr
  end

  def []=(key, value)
    arr.push([key, value])
  end

  def delete(key)
    arr.delete(key)
  end

  def delete_all
    arr.clear
  end

  def size
    arr.size
  end
end

p a = MyHash.new
p b = MyHash.new
p b['2'] = 'world'
p a['1'] = 'hello'
p a.delete(['1'])
p a
p b