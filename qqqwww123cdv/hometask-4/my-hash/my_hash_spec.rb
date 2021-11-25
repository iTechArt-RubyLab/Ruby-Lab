#!/usr/bin/env ruby
# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require './my_hash'
RSpec.describe MyHash do
  let(:hash) { described_class.new }
  before do
    hash['hello'] = 'world'
    hash['foo'] = 'too'
    hash[1] = 123
  end
  describe 'checking MyHash' do
    context 'when key exists' do
      it 'returns value' do
        expect(hash['hello']).to eq('world')
        expect(hash['foo']).to eq('too')
        expect(hash[1]).to eq 123
      end
      it '#delete method, return nil' do
        hash.delete('foo')
        expect(hash['foo']).to eq(nil)
      end
      it '#clear method, return empty hash' do
        expect(hash.clear).to be_empty
      end
      it '#length method, return length' do
        expect(hash.length).to eq 3
      end
    end
    context 'when the key does not exist' do
      it 'returns nil' do
        expect(hash['h']).to eq(nil)
        expect(hash['f']).to eq(nil)
        expect(hash[2]).to eq(nil)
      end
      it 'returns nil' do
        expect(hash.delete('some_key')).to eq(nil)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
