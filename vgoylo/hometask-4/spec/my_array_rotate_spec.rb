# frozen_string_literal: true

require_relative '../lib/my_array_rotate'
require 'pry'

# rubocop:disable Metrics/BlockLength
describe Array do
  let(:arr) { (1..7).to_a }

  describe '#lab_rotate' do
    context 'without parametr' do
      it 'rotates array' do
        expect(arr.lab_rotate).to eq [2, 3, 4, 5, 6, 7, 1]
        expect(arr).not_to eq [2, 3, 4, 5, 6, 7, 1]
      end
    end

    context 'positive parametr' do
      it 'rotates array' do
        expect(arr.lab_rotate(2)).to eq [3, 4, 5, 6, 7, 1, 2]
        expect(arr).not_to eq [3, 4, 5, 6, 7, 1, 2]
      end
    end

    context 'negative parametr' do
      it 'rotates array' do
        expect(arr.lab_rotate(-2)).to eq [6, 7, 1, 2, 3, 4, 5]
        expect(arr).not_to eq [6, 7, 1, 2, 3, 4, 5]
      end
    end
  end

  describe '#lab_rotate!' do
    context 'without parametr' do
      it 'rotates array' do
        expect(arr.lab_rotate!).to eq [2, 3, 4, 5, 6, 7, 1]
        expect(arr).to eq [2, 3, 4, 5, 6, 7, 1]
      end
    end

    context 'positive parametr' do
      it 'rotates array' do
        expect(arr.lab_rotate!(2)).to eq [3, 4, 5, 6, 7, 1, 2]
        expect(arr).to eq [3, 4, 5, 6, 7, 1, 2]
      end
    end

    context 'negative parametr' do
      it 'rotates array' do
        expect(arr.lab_rotate!(-2)).to eq [6, 7, 1, 2, 3, 4, 5]
        expect(arr).to eq [6, 7, 1, 2, 3, 4, 5]
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
