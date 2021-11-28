#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative 'my_hash'
require 'rspec'

RSpec.describe MyHash do
  subject(:my_hash) { described_class.new }

  describe '#[]' do
    before { my_hash[:key] = 2 }

    context 'when key is missed' do
      it "should return key's value" do
        expect(my_hash[:key]).to eq(2)
      end
    end

    context 'when the key went beyond the size of MyHash' do
      it 'should return nil ' do
        expect(my_hash[:a]).to eql(nil)
      end
    end

    context 'when the key is skipped' do
      it 'should show ArgumentError' do
        expect { my_hash[] }.to raise_error ArgumentError
      end
    end
  end

  describe '#[]=' do
    context 'when key and value are set' do
      it 'should add value to MyHash' do
        expect(my_hash.size).to eq(1)
      end
    end
    context 'when MyHash already contains given key' do
      it 'should replace the key value with a new one' do
        my_hash[:a] = 1
        expect(my_hash[:a]).to eq(1)
      end
    end
    context 'when key is not given' do
      it 'should raise Argument Error' do
        expect { my_hash[] }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#delete' do
    before { my_hash[:key] = 2 }
    context 'when key is given' do
      it 'should delete key-value pair from MyHash and return deleted value if key exists' do
        my_hash[:a] = 3
        my_hash.delete(:a)
        expect(my_hash[:a]).to eql(nil)
      end
    end
    context 'when key is missed' do
      it 'should raise ArgumentError' do
        my_hash[:a] = 3
        my_hash.delete(:a)
        expect { my_hash.delete[:a] }.to raise_error ArgumentError
      end
    end
  end

  describe '#clean' do
    before do
      my_hash[:a] = 1
      my_hash[:b] = 2
      my_hash[:c] = 3
    end
    context 'when my_hash includes pairs' do
      it 'returns number of pair' do
        expect { my_hash.clear }.to change { my_hash.size }.to(0)
        expect(my_hash[:a]).to eql(nil)
        expect(my_hash[:b]).to eql(nil)
        expect(my_hash[:c]).to eql(nil)
      end
    end
  end

  describe '#size' do
    subject(:hash_size) { my_hash.size }
    context 'when object is not blank' do
      before { my_hash[:a] = 1 }

      it { is_expected.to eq(1) }
    end
    context 'when object is blank' do
      it { is_expected.to be_zero }
    end
  end
end
