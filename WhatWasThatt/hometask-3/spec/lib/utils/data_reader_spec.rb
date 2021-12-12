# frozen_string_literal: true

require_relative './../../../lib/utils/data_reader'

RSpec.describe Utils::DataReader do
  describe '#call' do
    context 'when file opened' do
      let(:path) { 'data.txt' }
      let(:town_rainfall) do
        'Rome:Jan81.2,Feb63.2,Mar70.3,Apr55.7,May53.0,Jun36.4,Jul17.5,Aug27.5,Sep60.9,Oct117.7,Nov111.0,Dec97.9'
      end
      let(:result) do
        OpenStruct.new(success?: true, error_message: '', data: town_rainfall)
      end

      before do
        allow_any_instance_of(File).to receive(:read).and_return(town_rainfall)
      end

      context 'when success?' do
        it do
          expect(described_class.new(path).call.success?).to eq result.success?
        end
      end

      context 'when valid data' do
        it { expect(described_class.new(path).call.data).to eq result.data }
      end

      context 'when error message' do
        it { expect(described_class.new(path).call.error_message).to eq result.error_message }
      end
    end
  end
end
