# frozen_string_literal: true

require './lib/calculators/rainfall/calculator'

RSpec.describe Calculators::Rainfall::Calculator do
  describe '#call' do
    let(:data) do
      'London:Jan 48.0,Feb 38.9,Mar 39.9,Apr 42.2,May 47.3,Jun 52.1,Jul 59.5,
       Aug 57.2,Sep 55.4,Oct 62.0,Nov 59.0,Dec 52.9'
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
