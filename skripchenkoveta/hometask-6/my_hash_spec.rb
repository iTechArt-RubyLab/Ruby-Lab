# frozen_string_literal: true

require './myhash'
require 'rspec'

# rubocop:disable Metrics/BlockLength
RSpec.describe MyHash do
  let(:my_hash) { MyHash.new }

  before do
    my_hash['li'] = 'za'
    my_hash['my'] = 13
    my_hash[:b] = 'name'
    my_hash[404] = 'error'
  end

  describe 'describe #initialize' do
    it 'assigning values ​​to keys' do
      expect(my_hash['li']).to eq 'za'
      expect(my_hash['my']).to eq 13
      expect(my_hash[:b]).to eq 'name'
      expect(my_hash[404]).to eq 'error'
    end
  end

  describe 'describe #delete' do
    it 'removing item from the hash' do
      expect(my_hash.delete(404)).to eq []
    end
  end

  describe 'describe #length' do
    it 'number of elements in the hash' do
      expect(my_hash.length).to eq 4
    end
  end

  describe 'negative tests' do
    context 'all values ​​are stored strictly by key' do
      it 'returing the correct value' do
        expect(my_hash['li']).not_to eq 'ad'
        expect(my_hash[:b]).not_to eq 231
      end
    end
    context 'when passing the wrong number of arguments in a method' do
      it 'return error - ArgumentError' do
        expect { my_hash.length(7) }.to raise_error(ArgumentError)
        expect { my_hash.clear(7) }.to raise_error(ArgumentError)
      end
    end
    context 'when you initialize the hash incorrectly' do
      it 'return error - ArgumentError' do
        expect { my_hash(8) }.to raise_error(ArgumentError)
        expect { my_hash[] = 'liza' }.to raise_error(ArgumentError)
      end
    end
  end

  describe 'describe #clear' do
    it 'removing all elements from the hash' do
      expect(my_hash.clear.length).to eq 10
    end
  end
end
# rubocop:enable Metrics/BlockLength
