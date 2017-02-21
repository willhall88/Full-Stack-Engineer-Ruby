require 'rails_helper'

RSpec.describe ComicFetch do
  describe '#perform' do
    before(:each) do
      comic_api.perform
    end

    context 'when valid', :vcr do
      let(:comic_api) { ComicFetch.new(limit: 1) }

      subject(:status) { comic_api.result_data['code'] }
      it 'returns a 200 response code' do
        expect(status).to eq 200
      end

      subject(:comic_count) { comic_api.comics.count }
      it 'creates a Comic object' do
        expect(comic_count).to eq 1
      end
    end

    # context 'when invalid', :vcr do
    # end
  end
end
