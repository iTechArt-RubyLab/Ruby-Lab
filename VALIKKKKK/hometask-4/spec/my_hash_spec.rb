# frozen_string_literal: true

require_relative '../my_hash'

describe MyHash do
  let(:hash) { described_class.new }

  before do
    hash['1'] = 1
    hash['2'] = 2
    hash[1337] = 'nothing'
  end

  describe '#[]=' do
    context 'when key blank' do
      it 'add new key-value pair' do
        expect(hash[1338] = 'abc').to eq('abc')
        expect(hash[1338]).to eq('abc')
      end
    end

    context 'when key exists' do
      it 'overwrite value' do
        expect(hash[1337] = 'zxc').to eq('zxc')
      end
    end

    context 'when wrong number of parameters' do
      it 'raise ArgumentError' do
        expect { hash[] = 'abb' }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#[]' do
    context 'when key exists' do
      it 'returns value' do
        expect(hash['1']).to eq(1)
      end
    end

    context 'when key empty' do
      it 'raises ArgumentError' do
        expect { hash[] }.to raise_error(ArgumentError)
      end
    end

    context 'when key does not exist' do
      it 'returns nil' do
        expect(hash[123]).to be_nil
      end
    end
  end

  describe '#size' do
    context 'when valid' do
      it { expect(hash.size).to eq(3) }
    end
  end

  describe '#delete_by_key' do
    context 'when key exists' do
      it 'delete key-value pair' do
        expect(hash.delete_by_key('1')).to eq(1)
        expect(hash.size).to eq(2)
      end
    end

    context 'when key does not exist' do
      it 'returns nil' do
        expect(hash.delete_by_key(1234)).to be_nil
      end
    end
  end

  describe '#delete_all' do
    context 'when key-value pair exists' do
      it 'return ' do
        expect { hash.delete_all }.to change { hash.size }.by(-3)
      end
    end
  end
end
