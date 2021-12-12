# frozen_string_literal: true

require_relative './../../../../lib/calculators/rainfall/calculator'

RSpec.describe Calculators::Rainfall::Calculator do
  describe '#call' do
    let(:data) do
      'London:Jan48.0,Feb38.9,Mar39.9,Apr42.2,May47.3,Jun52.1,Jul59.5,Aug57.2,Sep55.4,Oct62.0,Nov59.0,Dec52.9'
    end
    let(:delta) { 0.1 }
    let(:town) { 'London' }

    context 'when valid data for mean' do
      let(:calculator_type) { :mean }
      let(:result) { 51.1 }

      it { expect(described_class.new(data, town, calculator_type).call).to be_within(delta).of(result) }
    end

    context 'when valid data for variance' do
      let(:calculator_type) { :variance }
      let(:result) { 57.4 }

      it { expect(described_class.new(data, town, calculator_type).call).to be_within(delta).of(result) }
    end
  end
end
