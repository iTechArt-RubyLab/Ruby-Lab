# frozen_string_literal: true

require './lib/utils/data_reader'

RSpec.describe Utils::DataReader do
  describe '#call' do
    context 'when file opened' do
      let(:path) { 'data.txt' }
      let(:town_rainfall) do
        'Rome:Jan 81.2,Feb 63.2,Mar 70.3,Apr 55.7,May 53.0,Jun 36.4,Jul 17.5,Aug 27.5,Sep 60.9'
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
