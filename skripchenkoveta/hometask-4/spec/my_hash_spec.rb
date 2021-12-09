# frozen_string_literal: true

require '../my_hash'
require 'rspec'

# rubocop:disable Metrics/BlockLength
RSpec.describe MyHash do
  subject(:my_hash) { described_class.new }

  before do
    my_hash['li'] = 'za'
    my_hash['my'] = 13
    my_hash[:b] = 'name'
    my_hash[404] = 'error'
  end

  describe '#[]=' do
    context 'introduction of new elements key=>value' do
      it 'return new elements in the hash' do
        expect(my_hash[:c] = 10).to eq 10
        expect(my_hash[1] = -3).to eq(-3)
      end
    end
    it 'return key=>value' do
      expect(my_hash['li']).to eq 'za'
      expect(my_hash['my']).to eq 13
    end
    context 'when you initialize the hash incorrectly' do
      it 'return error - ArgumentError' do
        expect { my_hash(8) }.to raise_error(ArgumentError)
        expect { my_hash[] = 'flower' }.to raise_error(ArgumentError)
      end
    end
  end
  describe '#[]' do
    context 'when read by key' do
      it 'return read by key=>value' do
        expect(my_hash[:b]).to eq 'name'
      end
    end
  end

  describe '#delete' do
    it 'remove element from the hash' do
      expect(my_hash.delete(404)).not_to eq 'error'
      expect(my_hash.delete(:b)).not_to eq 'name'
      expect(my_hash.delete('li')).not_to eq 'za'
    end
    context 'when pass the wrong number of arguments in a method' do
      it 'return error - ArgumentError' do
        expect { my_hash.delete }.to raise_error(ArgumentError)
        expect { my_hash.delete[1] }.to raise_error(ArgumentError)
        expect { my_hash.delete }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#length' do
    it 'number of elements in the hash' do
      expect(my_hash.length).to eq 4
    end
    context 'when pass the wrong number of arguments in a method' do
      it 'return error - ArgumentError' do
        expect { my_hash.length(7) }.to raise_error(ArgumentError)
        expect { my_hash.length[] }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#clear' do
    it 'remove all elements from the hash' do
      my_hash.clear
      expect(my_hash.length).to eq 0
    end
    context 'when pass the wrong number of arguments in a method' do
      it 'return error - ArgumentError' do
        expect { my_hash.clear(7) }.to raise_error(ArgumentError)
        expect { my_hash.clear[] }.to raise_error(ArgumentError)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
