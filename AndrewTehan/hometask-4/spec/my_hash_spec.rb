# frozen_string_literal: true

require_relative '../my_hash'

RSpec.describe MyHash do
  subject(:my_hash) { described_class.new }

  describe '#[]=' do
    context 'when key is missing' do
      it 'adds new key-value pair' do
        expect(my_hash[1] = :a).to eq(:a)
        expect(my_hash[1]).to eq(:a)
      end
    end

    context 'when key exists' do
      before { my_hash[1] = 1 }

      it 'overriddes value' do
        expect(my_hash[1]).to eq(1)
        expect(my_hash[1] = 3).to eq(3)
        expect(my_hash[1]).to eq(3)
      end
    end

    context 'when wrong number of parameters was passed' do
      it 'raises ArgumentError' do
        expect { my_hash[] = 3 }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#[]' do
    before { my_hash[:key] = 2 }

    context 'when key exists' do
      it 'returns value' do
        expect(my_hash[:key]).to eq(2)
      end
    end

    context "when the key doesn't exist" do
      it 'returns nil' do
        expect(my_hash[:a]).to be_nil
      end
    end

    context 'when wrong number of parameters was passed' do
      it 'raises ArgumentError' do
        expect { my_hash[] }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#delete' do
    before { my_hash[:key] = 2 }

    context 'when the key exists' do
      it 'deletes key-value pair' do
        expect { my_hash.delete(:key) }.to change { my_hash.length }.by(-1)
        expect(my_hash[:key]).to be_nil
      end

      it 'returns deleted value' do
        expect(my_hash.delete(:key)).to eq(2)
      end
    end

    context "when the key doesn't exist" do
      it 'returns nil' do
        expect(my_hash.delete(:a)).to be_nil
      end
    end

    context 'when the wrong number of parameters was passed' do
      it 'raises ArgumentError' do
        expect { my_hash.delete }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#delete_all' do
    before do
      my_hash[:a] = 1
      my_hash[:b] = 2
      my_hash[:c] = 3
    end

    context 'when my_hash includes pairs' do
      it 'returns number of pair' do
        expect { my_hash.delete_all }.to change { my_hash.length }.to(0)
        expect(my_hash[:a]).to be_nil
        expect(my_hash[:b]).to be_nil
        expect(my_hash[:c]).to be_nil
      end
    end
  end

  describe '#length' do
    subject(:hash_lenght) { my_hash.length }

    context 'when object is not blank' do
      before { my_hash[:a] = 1 }

      it { is_expected.to eq(1) }
    end

    context 'when object is blank' do
      it { is_expected.to be_zero }
    end
  end
end
