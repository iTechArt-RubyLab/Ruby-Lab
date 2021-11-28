# !/usr/bin/env ruby

# frozen_string_literal: true

require 'rspec/autorun'
require_relative 'my_array_rotate'

# rubocop:disable Metrics/BlockLength
RSpec.describe Array do
  describe '#lab_rotate' do
    context 'whe array is empty' do
      let(:array) { [] }
      it 'returns nil' do
        expect(array.lab_rotate).to eq(nil)
      end
    end

    context 'when array contains values' do
      let(:array) { [1, 2, 3] }
      it 'returns rotated array without changing it' do
        expect(array.lab_rotate).to eq([2, 3, 1])
        expect(array).to eq([1, 2, 3])
      end
    end
  end

  describe '#lab_rotate!' do
    context 'whe array is empty' do
      let(:array) { [] }
      it 'returns nil' do
        expect(array.lab_rotate!).to eq(nil)
      end
    end

    context 'when array contains values' do
      let(:array) { [1, 2, 3] }
      it 'returns rotated array ' do
        expect(array.lab_rotate!).to eq([2, 3, 1])
        expect(array).to eq([2, 3, 1])
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
