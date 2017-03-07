require 'rails_helper'

RSpec.describe MarvelApiClient do
  describe '#perform' do
    before(:each) do
      comic_api.perform(limit: 1)
    end

    context 'when valid', :vcr do
      let(:comic_api) { MarvelApiClient.new }

      subject(:comic_count) { comic_api.comics.count }
      it 'creates a Comic object' do
        expect(comic_count).to eq 1
      end
    end

    # context 'when invalid', :vcr do
    # end
  end

  describe '#search_characters' do
    context 'when valid', :vcr do
      let(:comic_api) { MarvelApiClient.new }
      subject(:character_count) { comic_api.search_characters('hulk').length }
      it 'can find multiple characters' do
        expect(character_count).to eq 9
      end
    end
  end
end
