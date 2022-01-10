# frozen_string_literal: true

require_relative 'my_hash'

RSpec.describe MyHash do
  subject(:my_hash) { described_class.new }

  describe '[]=' do
    before do
      my_hash['hello'] = 'world'
    end

    context 'when write key value' do
      it 'return' do
        expect(my_hash.length).to eq 1
      end
    end

    context 'when rewrite value by exist key' do
      it 'return' do
        expect(my_hash['hello']).to eq 'world'
      end
    end

    context 'when the key didnt pass' do
      it 'return error' do
        expect { my_hash[] = 'world' }.to raise_error(ArgumentError)
      end
    end
  end

  describe '[]' do
    before do
      my_hash['chao'] = 'persik'
    end

    context 'when read value by key' do
      it 'return value' do
        expect(my_hash['chao']).to eq('persik')
      end
    end

    context 'when key empty' do
      it 'return Error' do
        expect { my_hash[] }.to raise_error(ArgumentError)
      end
    end

    context 'when key does not exist' do
      it 'return nil' do
        expect(my_hash[123]).to be_nil
      end
    end
  end

  describe 'length' do
    before do
      my_hash['hello'] = 'world'
      my_hash['Alexey'] = 'Shparun'
      my_hash['itech'] = 'art'
    end

    context 'when getting size' do
      it 'return' do
        expect(my_hash.length).to eq 3
      end
    end
  end

  describe 'delete()' do
    before do
      my_hash['hello'] = 'world'
      my_hash.delete('hello')
    end

    context 'when delete key-value by key' do
      it 'return' do
        expect(my_hash['hello']).to eq nil
      end
    end

    context 'when key not passed' do
      it 'return error' do
        expect { my_hash.delete }.to raise_error(ArgumentError)
      end
    end
  end

  describe 'clear' do
    before do
      my_hash['hello'] = 'world'
      my_hash.clear
    end

    context 'when clear hash' do
      it 'return empty hash' do
        expect(my_hash.length).to eq 0
      end
    end
  end
end
