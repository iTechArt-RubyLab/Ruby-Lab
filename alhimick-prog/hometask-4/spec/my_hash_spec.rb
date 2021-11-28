#!/usr/bin/env ruby
# frozen_string_literal: true

require '../my_hash'
require 'rspec'

RSpec.describe MyHash do
  let(:my_hash) { described_class.new }

  before do
    my_hash['a'] = 1
    my_hash['b'] = 2
    my_hash['c'] = 3
  end

  describe 'add new item' do
    context 'when key is exisiting' do
      it 'value should overwritten' do
        expect(my_hash['a'] = 'new value').to eq 'new value'
      end
    end

    context 'with nil key' do
      it 'raises RuntimeError' do
        expect(my_hash[nil] = 123).to raise_error(RuntimeError)
      end
    end

    it 'length should equal' do
      expect(my_hash.length).to eq 3
    end
  end

  describe 'get item' do
    it 'value should equal' do
      expect(my_hash['a'].value).to eq 1
      expect(my_hash['b'].value).to eq 2
      expect(my_hash['c'].value).to eq 3
    end

    context 'key doesnt exist' do
      it 'raises RuntimeError' do
        expect(my_hash['1234']).to raise_error(RuntimeError)
      end
    end

    context 'key exist' do
      it 'raises RuntimeError' do
        expect(my_hash).to include my_hash[1234]
      end
    end
  end

  describe 'remove item' do
    context 'not exisiting item' do
      it 'raises RuntimeError' do
        expect(my_hash.remove('zxc')).to raise_error(RuntimeError)
      end
    end
  end

  describe 'clear hash' do
    before do
      my_hash.clear
    end

    it 'length should equal 0' do
      expect(my_hash.length).to eq 0
    end
  end
end
