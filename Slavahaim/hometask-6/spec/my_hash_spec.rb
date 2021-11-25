#!/usr/bin/env ruby
# frozen_string_literal: true

require '../my_hash'
require 'rspec'

# rubocop:disable Metrics/BlockLength
RSpec.describe MyHash do
  let(:my_hash) { described_class.new }

  describe '#[]=' do
    before do
      my_hash[1] = 1
      my_hash[2] = 2
      my_hash['s'] = 's'
    end

    it 'return changed hash size and write key=>value' do
      expect(my_hash.size).to eq 3
      expect(my_hash[1]).to eq 1
      expect(my_hash[5]).to be_nil
    end
  end

  describe '#[]' do
    before do
      my_hash[1] = 1
      my_hash[2] = 2
      my_hash['s'] = 's'
    end

    it 'return reading by key=>value and changed hash size' do
      expect(my_hash[1]).to eq 1
      expect(my_hash[2]).to eq 2
      expect(my_hash['s']).to eq 's'
      expect(my_hash[5]).to be_nil
    end
  end

  describe '#delete' do
    before do
      my_hash[1] = 1
      my_hash[2] = 2
      my_hash['s'] = 's'

      my_hash.delete(1)
    end

    it 'delete element and chenged size end value of deleted element = nil' do
      expect(my_hash.size).to eq 2
      expect(my_hash[1]).to be_nil
    end
  end

  describe '#delete_all' do
    before do
      my_hash[1] = 1
      my_hash[2] = 2
      my_hash['s'] = 's'

      my_hash.delete_all
    end
    it 'delete all elements and size be 0 ' do
      expect(my_hash.size).to eq 0
      expect(my_hash[1]).to be_nil
    end
  end
end
# rubocop:enable Metrics/BlockLength
