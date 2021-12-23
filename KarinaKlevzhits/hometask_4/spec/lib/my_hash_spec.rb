# frozen_string_literal: true

require_relative '../../my_hash'
require 'rspec'

RSpec.describe MyHash do
  subject(:my_hash) { described_class.new }

  describe '#[]=' do
    before { my_hash[:a] = 5 }

    context 'when key does not exist' do
      it { expect(my_hash[:a]).to eq(5) }
    end

    context 'when not valid parametrs of key' do
      it { expect { my_hash[] = 5 }.to raise_error(ArgumentError) }
    end
  end

  describe '#[]' do
    before { my_hash[:key] = 'hello' }

    context 'when key exists' do
      it { expect(my_hash[:key]).to eq('hello') }
    end

    context 'when key does not exists' do
      it { expect(my_hash[:key2]).to eq(nil) }
    end
  end

  describe '#delete' do
    before { my_hash[:key] = 'ruby' }

    context 'when key exists' do
      before { my_hash.delete(:key) }

      it { expect(my_hash[:key]).to eq(nil) }
    end

    context 'when key does not exists' do
      it { expect(my_hash.delete(:key2)).to eq(nil) }
    end

    context 'when wrong parametrs in method delete' do
      it { expect { my_hash.delete }.to raise_error(ArgumentError) }
    end
  end

  describe '#clear' do
    before do
      my_hash[1] = 1
      my_hash[2] = 2
      my_hash.clear
    end

    context 'when all data is valid' do
      it 'key is nil' do
        expect(my_hash[2]).to eq(nil)
      end

      it 'length' do
        expect(my_hash.length).to eq(0)
      end
    end

    context 'when wrong length after clear' do
      it { expect(my_hash.length).not_to eq(2) }
    end
  end

  describe '#length' do
    before do
      my_hash[1] = 1
      my_hash[2] = 2
      my_hash[3] = 3
      my_hash[4] = 4
      my_hash[5] = 5
    end

    context 'when object is valid' do
      it { expect(my_hash.length).to eq(5) }
    end

    context 'when not valid data' do
      it { expect(my_hash.length).not_to eq(9) }
    end
  end
end
