# frozen_string_literal: true

require_relative '../lib/my_hash'
require 'pry'

# rubocop:disable Metrics/BlockLength
describe MyHash do
  let(:my_hash) { describe_class.new }

  describe '#[]=' do
    before {  my_hash[1] = 5 }

    it 'shoud change hash size' do
      expect(my_hash.count).to eq 1
      expect(my_hash[1]).to eq 5
    end
  end

  describe '#[]' do
    before do
      my_hash[1] = 5
      my_hash[3] = 1
      my_hash[2] = 3
    end

    it 'shoud get correct element' do
      expect(my_hash[1]).to eq 5
      expect(my_hash[3]).to eq 1
      expect(my_hash[2]).to eq 3
    end
  end

  describe '#remove' do
    before do
      my_hash[1] = 5
      my_hash[3] = 1
      my_hash[2] = 3

      my_hash.remove(1)
    end

    it 'delete element' do
      expect(my_hash.count).to eq 2
      expect(my_hash[1]).to be_nil
    end
  end

  describe '#clean' do
    before do
      my_hash[1] = 5
      my_hash[3] = 1
      my_hash[2] = 3

      my_hash.clean
    end

    it 'clean the hash' do
      expect(my_hash.count).to eq 0
    end
  end
end
# rubocop:enable Metrics/BlockLength
