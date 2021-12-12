# frozen_string_literal: true

require_relative './../../../../../lib/calculators/rainfall/operations/average'

RSpec.describe Calculators::Rainfall::Operations::Average do
  describe '#call' do
    let(:rainfall_collection) { [81.2, 63.2, 70.3, 55.7, 53.0, 36.4, 17.5, 27.5, 60.9, 117.7, 111.0, 97.9] }
    let(:delta) { 0.1 }
    let(:result) { 66.0 }

    it { expect(described_class.new(rainfall_collection).call).to be_within(delta).of(result) }
  end
end
