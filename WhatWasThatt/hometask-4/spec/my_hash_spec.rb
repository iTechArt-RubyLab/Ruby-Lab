# frozen_string_literal: true

require_relative '../my_hash'

RSpec.describe MyHash do
  subject(:my_hash) { described_class.new }

  before do
    10.times { |iterator| my_hash[iterator] = iterator.to_f }
  end

  describe '#[]' do
    context 'with valid data for 0' do
      it { expect(my_hash[0]).to eq 0.0 }
    end

    context 'with non-existent value' do
      it { expect(my_hash[14]).to be_nil }
    end

    context 'with empty data' do
      it { expect { my_hash[] }.to raise_error(ArgumentError) }
    end
  end

  describe '#[]=' do
    before { my_hash[10] = 10.0 }

    context 'with valid data for 10' do
      it { expect(my_hash[10]).to eq 10.0 }
    end

    context 'with empty value' do
      it { expect { my_hash[] = 1 }.to raise_error(ArgumentError) }
    end
  end

  describe '#delete' do
    before { my_hash.delete(8) }

    context 'with non-existent deleted value' do
      it { expect(my_hash[8]).to be_nil }
    end

    context 'with valid length' do
      it { expect(my_hash.length).to eq 9 }
    end

    context 'with invalid non-existent value' do
      it { expect(my_hash[8]).not_to eq 8.0 }
    end
  end

  describe '#length' do
    before { my_hash.delete(4) }

    context 'with valid length' do
      it { expect(my_hash.length).to eq 9 }
    end

    context 'with invalid length' do
      it { expect(my_hash.length).not_to eq 10 }
    end
  end

  describe '#clear' do
    before { my_hash.clear }

    context 'with deleted value' do
      it { expect(my_hash[0]).to be_nil }
    end

    context 'with invalid non-existent value' do
      it { expect(my_hash[1]).not_to eq 1.0 }
    end
  end
end
