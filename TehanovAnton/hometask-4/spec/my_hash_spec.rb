# frozen_string_literal: true

require_relative '../my_hash'
require 'pry'

RSpec.describe MyHash do
  describe '[]=' do
    before do
      my_hash[:a] = 5
    end

    let(:my_hash) { described_class.new }

    it 'write new key value pair' do
      expect(my_hash.size).to eq(1)
    end

    it 'rewrite value by key' do
      my_hash[:a] = 1
      expect(my_hash[:a]).to eq(1)
    end

    it 'raise ArgumentError error if no key passed' do
      expect { my_hash[] = 5 }.to raise_error(ArgumentError)
    end
  end

  describe '[]' do
    let(:my_hash) { described_class.new }

    it 'read value by key' do
      my_hash[:a] = 5
      expect(my_hash[:a]).to eq(5)
    end

    it 'return nil if no key' do
      expect(my_hash[:a]).to be_nil
    end

    it 'raise ArgumentError if no key passed' do
      expect { my_hash[] }.to raise_error(ArgumentError)
    end
  end

  describe 'delete method' do
    let(:my_hash) { described_class.new }

    it 'delete key value' do
      my_hash[:a] = 5
      my_hash.delete(:a)
      expect(my_hash[:a]).to eq(nil)
    end

    it 'raise ArgumentError if no key passed' do
      expect { my_hash.delete }.to raise_error(ArgumentError)
    end
  end

  describe 'clear method' do
    let(:my_hash) { described_class.new }

    it 'clear hash' do
      my_hash[:a] = 5
      my_hash.clear
      expect(my_hash.size).to eq(0)
    end
  end

  describe 'length and size methods' do
    let(:my_hash) { described_class.new }

    it 'length return hash key value pairs amount' do
      my_hash[:a] = 5
      expect(my_hash.length).to eq(1)
    end

    it 'size return hash key value pairs amount' do
      my_hash[:a] = 5
      my_hash[:b] = 6
      expect(my_hash.size).to eq(2)
    end
  end
end
