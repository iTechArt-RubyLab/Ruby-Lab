# frozen_string_literal: true

require_relative './my_hash'
require 'rspec'

describe MyHash do
  describe '#[]=' do
    let!(:my_hash) { MyHash.new }
    context 'when value does not exist' do
      it 'return pair key-value' do
        (my_hash[:key1] = '')
        expect(my_hash[:key1]).to eq('')
      end
    end

    context 'when value exist' do
      before do
        my_hash[:key1] = 54
      end

      it 'replace value' do
        expect(my_hash[:key1]).to eq(54)
        expect { my_hash[:key1] = 98 }.to change { my_hash[:key1] }.to(98)
      end
    end

    context 'when wrong parameters' do
      it 'return error' do
        expect { my_hash[] = 3 }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#[]' do
    let(:my_hash) { MyHash.new }
    before do
      my_hash[:key] = :value1
    end

    context 'when key exist' do
      it 'return value' do
        expect(my_hash[:key]).to eq(:value1)
      end
    end

    context 'when key does not exist' do
      it 'return nil' do
        expect(my_hash[:not_exist]).to eq(nil)
      end
    end

    context 'when wrong number of parameters was passed' do
      it 'return error' do
        expect { my_hash[] }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#delete' do
    let(:my_hash) { MyHash.new }
    before do
      my_hash[:key] = 34
    end

    context 'when the key exist' do
      it 'delete key-value' do
        my_hash.delete(:key)
        expect(my_hash[:key]).to eq(nil)
      end

      context 'when the wrong number of parameters was passed' do
        it 'raises ArgumentError' do
          expect { my_hash.delete }.to raise_error(ArgumentError)
        end
      end
    end
  end

  describe '#clear' do
    let(:my_hash) { MyHash.new }
    it 'return length = 0 ' do
      my_hash[:a] = 82
      my_hash.clear
      expect(my_hash.length).to eq(0)
    end
  end

  describe 'when the key exist' do
    let(:my_hash) { MyHash.new }
    it 'return length of hash' do
      my_hash[:a] = 82
      expect(my_hash.length).to eq(1)
    end
  end
end
