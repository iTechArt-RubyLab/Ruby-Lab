# frozen_string_literal: true

require_relative 'my_hash'

describe MyHash do
  let(:hash) { MyHash.new }

  describe '#initialize' do
    it 'creates new hash' do
      expect(MyHash.new).to be_an_instance_of(MyHash)
    end
  end

  describe '#delete' do
    it 'deletes value by key' do
      hash[:key] = 'value'
      hash.delete(:key)
      expect(hash[:key]).to eq(nil)
    end
    it 'deletes existing key-value pair' do
      hash = MyHash.new
      hash[:name] = 'Vasya'
      hash.delete(:name)
      expect(hash[:name]).to be_nil
    end
    context 'when hash is empty' do
      it 'returns nil' do
        hash = MyHash.new
        expect(hash.delete(:name)).to be_nil
      end
    end
  end
  describe '#delete_all' do
    it 'resets hash' do
      hash[:key] = 'value'
      hash.delete_all
      expect(hash[:key]).to eq(nil)
    end
  end

  describe '#length' do
    it 'returns number of pairs' do
      hash[:key] = 'value'
      expect(hash.length).to eq(1)
    end
  end

  describe '#[]' do
    context 'when key is nil' do
      it 'returns nil' do
        expect(hash[nil]).to be_nil
      end
    end
  end
end

describe '#each' do
  it 'iterates over each key-value pair' do
    hash = MyHash.new
    hash[:name] = 'Gek'
    hash[:age] = '20'
    hash[:height] = '1.80'
    hash[:weight] = '80'
    hash.each { |key, value| puts "#{key}: #{value}" }
  end
  context 'when hash is empty' do
    it 'prints nothing' do
      hash = MyHash.new
      hash.each { |key, value| puts "#{key}: #{value}" }
    end
  end

  describe '#[](key)' do
    context 'when key is nil' do
      it 'returns nil' do
        hash = MyHash.new
        expect(hash[nil]).to be_nil
      end
    end
  end
end

describe 'negative tests' do
  context 'when key is a string' do
    it 'returns nil' do
      hash = MyHash.new
      hash[:key] = 'value'
      expect(hash['key']).to be_nil
    end
  end
  context 'when key is a number' do
    it 'returns nil' do
      hash = MyHash.new
      hash[:key] = 'value'
      expect(hash[1]).to be_nil
    end
  end
  context 'when key is a boolean' do
    it 'returns nil' do
      hash = MyHash.new
      hash[:key] = 'value'
      expect(hash[true]).to be_nil
    end
  end
  context 'when key is an array' do
    it 'returns nil' do
      hash = MyHash.new
      hash[:key] = 'value'
      expect(hash[[]]).to be_nil
    end
  end
  context 'when key is an object' do
    it 'returns nil' do
      hash = MyHash.new
      hash[:key] = 'value'
      expect(hash[Object.new]).to be_nil
    end
  end
end
