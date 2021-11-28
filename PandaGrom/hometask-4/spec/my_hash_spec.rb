# frozen_string_literal: true

require '../my_hash'

# rubocop:disable Metrics/BlockLength

describe MyHash do
  let(:hash) { described_class.new }
  before do
    hash['hello'] = 1
    hash['world'] = 2
    hash[4237] = 'code'
  end
  describe '#=[]' do
    it 'assigns values to the keys and show the size of the array according to the number of values' do
      expect(hash['hello']).to eq 1
      expect(hash['world']).to eq 2
      expect(hash[4237]).to eq 'code'
    end
  end

  describe '#[]' do
    it 'output the correct key values' do
      expect(hash['hello']).to eq 1
      expect(hash['world']).to eq 2
      expect(hash[4237]).to eq 'code'
    end
  end

  describe '#size' do
    it 'show hash size' do
      expect(hash.size).to eq 3
    end
  end

  describe '#delete_all' do
    it 'should show a clean hash' do
      expect(hash.delete_all.size).to eq 0
    end
  end

  describe 'hash content' do
    it 'should return the correct items in the hash' do
      expect(hash.array).to contain_exactly('world', 'hello', 1, 2, 4237, 'code')
    end

    describe 'negative situations'
    it 'return false' do
      expect(hash.array.include?('arr')).to eq false
      expect(hash.array.empty?).to eq false
    end
  end
end
# rubocop:enable Metrics/BlockLength
