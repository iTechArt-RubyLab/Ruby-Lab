# frozen_string_literal: true

require '../my_hash'

# rubocop:disable Metrics/BlockLength
describe MyHash do
  let(:hash) { described_class.new }

  describe 'creating a new pair' do
    before do
      hash['hello'] = 1
      hash['world'] = 2
      hash[4237] = 'code'
    end

    it 'this should assign values to the keys and show the size of the array according to the number of values' do
      expect(hash['hello']).to eq 1
      expect(hash['world']).to eq 2
      expect(hash[4237]).to eq 'code'
      expect(hash.size).to eq 3
    end
  end

  describe 'searching for a value by key' do
    before do
      hash['hello'] = 1
      hash['world'] = 2
      hash[4237] = 'code'
    end

    it 'this should output the correct key values' do
      expect(hash['hello']).to eq 1
      expect(hash['world']).to eq 2
      expect(hash[4237]).to eq 'code'
    end
  end

  describe 'deleting all elements' do
    before do
      hash['hello'] = 1
      hash['world'] = 2
      hash[4237] = 'code'
    end

    it 'this should show a clean hash' do
      expect(hash.delete_all.size).to eq 0
    end
  end

  describe 'hash content' do
    before do
      hash['hello'] = 1
      hash['world'] = 2
      hash[4237] = 'code'
    end

    it 'this should return the correct items in the hash' do
      expect(hash.array).to include('world')
      expect(hash.array).to contain_exactly('world', 'hello', 1, 2, 4237, 'code')
    end

    it 'negative scripts' do
      expect(hash.array.include?('arr')).to eq false
      expect(hash.array.empty?).to eq false
    end
  end
end
# rubocop:enable Metrics/BlockLength
