# frozen_string_literal: true

require_relative '../my_hash/my_hash'

RSpec.describe MyHash do
  describe '[]=' do
    before do
      my_hash['hello'] = 'world'
    end

    let(:my_hash) { described_class.new }

    context 'when write key value' do
      it { expect(my_hash.size).to eq 1 }
    end

    context 'when rewrite value by exist key' do
      it { expect(my_hash['hello']).to eq 'world' }
    end

    context 'when key not passed' do
      it { expect { my_hash[] = 'world' }.to raise_error(ArgumentError) }
    end
  end

  describe '[]' do
    before do
      my_hash['hello'] = 3
    end

    let(:my_hash) { described_class.new }

    context 'when read value by a key' do
      it { expect(my_hash['hello']).to eq 3 }
    end

    context 'when value not exist' do
      it { expect(my_hash['idk']).to be_nil }
    end

    context 'when key not passed' do
      it { expect { my_hash[] }.to raise_error(ArgumentError) }
    end
  end

  describe 'delete()' do
    before do
      my_hash['hello'] = 'world'
      my_hash.delete('hello')
    end

    let(:my_hash) { described_class.new }

    context 'when delete key-value by key' do
      it { expect(my_hash['hello']).to eq nil }
    end

    context 'when key not passed' do
      it { expect { my_hash.delete }.to raise_error(ArgumentError) }
    end
  end

  describe 'clear' do
    before do
      my_hash['hello'] = 'world'
      my_hash.clear
    end

    let(:my_hash) { described_class.new }

    context 'when clear all from hash' do
      it { expect(my_hash.size).to eq 0 }
    end
  end

  describe 'size' do
    before do
      my_hash['hello'] = 'world'
      my_hash['foo'] = 'bar'
      my_hash['ilike'] = 'ruby'
    end

    let(:my_hash) { described_class.new }

    context 'when getting size' do
      it { expect(my_hash.size).to eq 3 }
    end
  end
end
