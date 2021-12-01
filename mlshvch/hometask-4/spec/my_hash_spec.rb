#!/usr/bin/env ruby

# frozen_string_literal: true

require 'rspec'
require_relative '../my_hash'

describe MyHash do
  subject(:my_hash) { MyHash.new }

  describe '#[]=' do
    context 'when key and value are given' do
      it 'should add value to MyHash, returns assigned value and increases size' do
        expect(my_hash['a'] = 1).to eq(1)
        expect(my_hash[248] = %w[12 24]).to eq(%w[12 24])
      end
    end

    context 'when MyHash already contains given key' do
      it 'should replace value of the key with the new one' do
        expect(my_hash['a1'] = 2).to eq(2)
        expect(my_hash['a4'] = 7).to eq(7)
      end
    end

    context 'when key is not given' do
      it 'should raise Argument Error' do
        expect(hash[] = 4).to raise_error ArgumentError
      end
    end
  end

  describe '#[]' do
    before { 10.times { |index| my_hash["a#{index}"] = index } }

    context 'when key is passed' do
      it "should return key's value" do
        expect(my_hash['a4']).to eq(4)
      end
    end

    context "when key haven't been given to MyHash" do
      it 'should return nil ' do
        expect(my_hash['a10']).to eql(nil)
      end
    end

    context 'when key is missed' do
      it 'should raise ArgumentError' do
        expect(my_hash[]).to raise_error(ArgumentError)
      end
    end
  end

  describe '#delete' do
    before { 10.times { |index| my_hash["a#{index}"] = index } }

    context 'when key is given' do
      it 'should delete key-value pair from MyHash and return deleted value if key exists' do
        expect(my_hash.delete('a1')).to eql(1)
        expect(my_hash['a1']).to eql(nil)
      end
    end

    context 'when key is missed' do
      it 'should raise ArgumentError' do
        expect(my_hash.delete()).to raise_error(ArgumentError)
      end
    end
  end

  describe '#clean' do
    before { 10.times { |index| my_hash["a#{index}"] = index } }

    context 'when method is called' do
      it 'should clear MyHash' do
        my_hash.clean
        expect(my_hash.size).to eql(0)
      end
    end
  end

  describe '#size' do
    before { 10.times { |index| my_hash["a#{index}"] = index } }

    context 'when new key-value pair is added' do
      it 'should increase size by 1' do
        my_hash[rand] = rand
        expect(my_hash.size).to eql(11)
      end
    end

    context 'when value of key is changed' do
      it 'should stay the same' do
        my_hash['a1'] = 14
        expect(my_hash.size).to eql(10)
      end
    end

    context 'when key-value pair is deleted' do
      it 'should decrease size by 1' do
        my_hash.delete('a9')
        expect(my_hash.size).to eql(9)
      end
    end
  end
end
