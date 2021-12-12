# frozen_string_literal: true

require './lib/utils/data_parser'

RSpec.describe Utils::DataParser do
  describe '#call' do
    let(:read_data) { 'Rome:Jan 81.2,Feb 63.2,Mar 70.3,Apr 55.7,May 53.0,Jun 36.4,Jul 17.5,Aug 27.5,Sep 60.9' }
    let(:town) { 'Rome' }
    let(:result) { [81.2, 63.2, 70.3, 55.7, 53.0, 36.4, 17.5, 27.5, 60.9, 117.7, 111.0, 97.9] }

    it { expect(described_class.new(read_data, town).call.data).to eq result }
  end
end
