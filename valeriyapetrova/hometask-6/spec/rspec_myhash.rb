# frozen_string_literal: true

require_relative './my_hash'
# rubocop:disable Metrics/BlockLength:
RSpec.describe MyHash do
  let(:myhash) { MyHash.new }

  describe '#[]=(key_input, value_input)' do
    context 'when add a pair of key/value' do
      before do
        myhash[:input_key] = :input_value
      end
      let(:input_key) { 1 }
      let(:input_value) { 10 }

      it { expect(myhash[input_key] = input_value).to be_kind_of input_value.class }
    end
  end

  before do
    myhash['learn'] = 'Ruby'
    myhash['Lera'] = 'Petrova'
    myhash[1] = 2
    myhash[3] = 4
  end
  describe '#size_of_my_hash ' do
    context 'size of MyHash when it is empty' do
      it { expect(myhash.size_of_my_hash).to eq(4) }
    end
  end
  describe '#[]=(key_input, value_input)' do
    context 'when add a pair of key/value test 2' do
      it  { expect(myhash.size_of_my_hash).to eq(4) }
    end
  end

  describe '#[](key_input)' do
    context 'when value output by key' do
      it  { expect(myhash['learn']).to eq('Ruby') }
      it  { expect(myhash['Lera']).to eq('Petrova') }
      it  { expect(myhash[1]).to eq(2) }
      it  { expect(myhash[3]).to eq(4) }
    end
  end

  describe '#cleaning' do
    context 'when delete all pairs of key/value' do
      before do
        myhash.cleaning
      end
      it { expect(myhash.size_of_my_hash).to eq(0) }
    end
  end

  describe '#delete' do
    context 'when delete key/value by key' do
      before do
        myhash.delete(1)
      end

      it { expect(myhash.size_of_my_hash).to eq(3) }
    end
  end

  describe 'negative' do
    context 'when test by negative scenario' do
      it { expect(myhash.size_of_my_hash).to_not eq 0 }
    end
  end
end
# rubocop:enable Metrics/BlockLength:
