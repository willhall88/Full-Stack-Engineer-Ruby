require 'rails_helper'

RSpec.describe MarvelApiClient do
  describe '#perform' do
    before(:each) do
      comic_api.perform
    end

    context 'when valid', :vcr do
      let(:comic_api) { MarvelApiClient.new(limit: 1) }

      subject(:comic_count) { comic_api.comics.count }
      it 'creates a Comic object' do
        expect(comic_count).to eq 1
      end
    end

    # context 'when invalid', :vcr do
    # end
  end
end
