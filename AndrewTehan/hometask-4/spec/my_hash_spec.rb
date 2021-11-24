# frozen_string_literal: true

require_relative '../my_hash'
require 'pry'

RSpec.describe MyHash do
  subject(:my_hash) { described_class.new }

  describe '#[]=' do
    context 'when key is missing' do
      it 'adds new key-value pair' do
        expect(subject[1] = :a).to eq(:a)
        expect(subject[1]).to eq(:a)
      end
    end

    context 'when key exists' do
      before do
        subject[1] = 1
      end

      it 'overriddes value' do
        expect(subject[1]).to eq(1)
        expect(subject[1] = 3).to eq(3)
        expect(subject[1]).to eq(3)
      end
    end

    context 'when wrong number of parameters was passed' do
      it 'raises ArgumentError' do
        expect { my_hash[] = 3 }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#[]' do
    before do
      subject[:key] = 2
    end

    context 'when key exists' do
      it 'returns value' do
        expect(subject[:key]).to eq(2)
      end
    end

    context "when the key doesn't exist" do
      it 'returns nil' do
        expect(subject[:a]).to eq(nil)
      end
    end

    context 'when wrong number of parameters was passed' do
      it 'raises ArgumentError' do
        expect { subject[] }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#delete' do
    before do
      subject[:key] = 2
    end

    context 'when the key exists' do
      it 'deletes key-value pair' do
        expect { subject.delete(:key) }.to change { subject.length }.by(-1)
        expect(subject[:key]).to eq(nil)
      end

      it 'returns deleted value' do
        expect(subject.delete(:key)).to eq(2)
      end
    end

    context "when the key doesn't exist" do
      it 'returns nil' do
        expect(subject.delete(:a)).to eq(nil)
      end
    end

    context 'when the wrong number of parameters was passed' do
      it 'raises ArgumentError' do
        expect { subject.delete }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#delete_all' do
    before do
      subject[:a] = 1
      subject[:b] = 2
      subject[:c] = 3
    end

    context 'when my_hash includes pairs' do
      it 'returns number of pair' do
        expect { subject.delete_all }.to change { subject.length }.to(0)
        expect(subject[:a]).to eq(nil)
        expect(subject[:b]).to eq(nil)
        expect(subject[:c]).to eq(nil)
      end
    end
  end

  describe '#length' do
    context 'when object is not blank' do
      before do
        subject[:a] = 1
      end

      it do
        expect(subject.length).to eq(1)
      end
    end

    context 'when object is not blank' do
      it do
        expect(subject.length).to eq(0)
      end
    end
  end
end
