# frozen_string_literal: true

require_relative './../../../lib/utils/data_parser'

RSpec.describe Utils::DataParser do
  describe '#call' do
    let(:read_data) do
      'Rome:Jan81.2,Feb63.2,Mar70.3,Apr55.7,May53.0,Jun36.4,Jul17.5,Aug27.5,Sep60.9,Oct117.7,Nov111.0,Dec97.9'
    end
    let(:town) { 'Rome' }
    let(:result) { [81.2, 63.2, 70.3, 55.7, 53.0, 36.4, 17.5, 27.5, 60.9, 117.7, 111.0, 97.9] }

    it { expect(described_class.new(read_data, town).call.data).to eq result }
  end
end
