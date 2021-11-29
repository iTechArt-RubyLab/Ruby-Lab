#!/usr/bin/env ruby
# frozen_string_literal: true

require '../my_hash'
require 'rspec'

# rubocop:disable Metrics/BlockLength
RSpec.describe MyHash do
  subject(:my_hash) { described_class.new }

  before do
    my_hash[1] = 1
    my_hash[2] = 2
    my_hash['s'] = 's'
  end

  describe '#[]=' do
    context 'when add elements changed size'
    it 'return changed hash size ' do
      expect(my_hash.size).to eq 3
    end
    it 'return key=>value' do
      expect(my_hash[1]).to eq 1
    end
    it 'return unknown element to be nil' do
      expect(my_hash[5]).to be_nil
    end
  end

  describe '#[]' do
    context 'when write value by key and read value by key' do
      it 'return reading by key=>value' do
        expect(my_hash[1]).to eq 1
        expect(my_hash[2]).to eq 2
        expect(my_hash['s']).to eq 's'
      end
      it 'return unknown element to be nil' do
        expect(my_hash[5]).to be_nil
      end
    end
  end

  describe '#delete' do
    context 'when delete one elemnt' do
      before do
        my_hash.delete(1)
      end
      it 'return size one less' do
        expect(my_hash.size).to eq 2
      end
      it 'deleted element return nil' do
        expect(my_hash[1]).to be_nil
      end
    end
  end

  describe '#delete_all' do
    context 'when delete all elements' do
      before do
        my_hash.delete_all
      end
      it 'delete all elements and size be 0 ' do
        expect(my_hash.size).to eq 0
      end
      it 'default element  nil ' do
        expect(my_hash[1]).to be_nil
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
