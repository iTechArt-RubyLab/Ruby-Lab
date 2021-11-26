require_relative './my_hash'
require 'pry'
require 'rspec'

describe MyHash do
  subject(:my_hash) { described_class.new }

  describe '#[]=' do
    context 'when value does not exist' do
      it 'return pair key-value' do
        expect(my_hash[:key1] = '').to eq('')
        expect(my_hash[:key1]).to eq('')
      end
    end

    context 'when value exist' do
      before do
        subject[:key1] = 54
      end

      it 'replace value' do
        expect(my_hash[:key1]).to eq(54)
        expect(my_hash[:key1] = 98).to eq(98)
        expect(my_hash[:key1]).to eq(98)
      end
    end

    context 'when wrong parameters' do
      it 'return error' do
        expect { my_hash[] = 3 }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#[]' do
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
    before do
      my_hash[:key] = 2
    end

    context 'when the key exists' do
      it 'deletes key-value pair' do
        subject.delete(:key)
        expect(my_hash[:key]).to eq(nil)
      end

      context "when the key doesn't exist" do
        it 'returns nil' do
          expect(subject.delete(:a)).to eq([])
        end
      end

      context 'when the wrong number of parameters was passed' do
        it 'raises ArgumentError' do
          expect { subject.delete }.to raise_error(ArgumentError)
        end
      end
    end
  end

  describe 'clear method' do
    it 'clear hash' do
      my_hash[:a] = 5
      my_hash.clear
      expect(my_hash[:a]).to eq(nil)
    end
  end

  describe 'length and size methods' do
    it 'length return hash key value pairs amount' do
      my_hash[:a] = 5
      expect(my_hash.length).to eq(1)
    end
  end
end
