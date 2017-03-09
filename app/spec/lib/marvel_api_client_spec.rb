require 'rails_helper'

RSpec.describe MarvelApiClient do
  let(:comic_api) { MarvelApiClient.new }
  before(:each) do
    Rails.cache.clear
  end

  describe '#perform' do
    context 'when valid', :vcr do
      before(:each) do
        comic_api.perform(limit: 1)
      end
      it { expect(comic_api.comics).to be_instance_of(Array) }
      it { expect(comic_api.comics.first.keys).to eq [:id, :title, :thumbnail] }
    end

    context 'when invalid', :vcr do
      before(:each) do
        comic_api.perform(limit: 1, offset: 'bad', characters: 'nope')
      end
      it do
        result = { error: "You must pass at least one valid character if you set the character filter." }
        expect(comic_api.comics).to eq result
      end
    end
  end

  describe '#search_characters' do
    context 'when valid', :vcr do
      subject(:character_count) { comic_api.search_characters('hulk').length }
      it 'can find multiple characters' do
        expect(character_count).to eq 9
      end
    end

    context 'when empty search', :vcr do
      subject(:character_count) { comic_api.search_characters('').length }
      it 'can find multiple characters' do
        expect(character_count).to eq 0
      end
    end
  end
end
