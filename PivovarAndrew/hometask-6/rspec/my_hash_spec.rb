# !/usr/bin/env ruby
# frozen_string_literal: true

require './model/my_hash'

RSpec.describe MyHash do
  let(:my_hash) { described_class.new }

  before do
    my_hash['abc'] = 12344
    my_hash['def'] = 54327
    my_hash['ghij'] = 12356
    my_hash[8765] = "dsa"
    my_hash[2307] = 3259
  end

  describe 'add new item' do
    context 'when key is exisiting' do
      it 'value should overwritten' do
        expect(my_hash["def"] = "new value").to eq "new value"
      end
    end

    context 'with nil key' do
      it 'raises RuntimeError' do
        expect(my_hash[nil] = 23).to raise_error(RuntimeError)
      end
    end

    it 'length should equal' do
      expect(my_hash.length).to eq 5
    end
  end

  describe 'get item' do
    it 'value should equal' do
      expect(my_hash["abc"].value).to eq 12344
      expect(my_hash[8765].value).to eq "dsa"
      expect(my_hash[2307].value).to eq 3259
    end

    context 'key doesnt exist' do
      it 'raises RuntimeError' do
        expect(my_hash['1234']).to raise_error(RuntimeError)
      end
    end

    context 'key exist' do
      it 'raises RuntimeError' do
        expect(my_hash).to include my_hash[8765]
      end
    end
  end

  describe 'remove item' do
    context 'not exisiting item' do
      it 'raises RuntimeError' do
        expect(my_hash.remove("mnb")).to raise_error(RuntimeError)
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
