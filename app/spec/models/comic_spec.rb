require 'rails_helper'

RSpec.describe Comic, type: :model do
  describe '#title' do
    context 'when valid' do
      let(:comic) { Comic.new('title' => 'Ant-Man') }
      subject(:title) { comic.title }
      it { is_expected.to eq 'Ant-Man' }
    end

    context 'when not valid' do
      let(:comic) { Comic.new }
      subject(:title) { comic.title }
      it { is_expected.to eq 'Title: Not Found' }
    end
  end

  describe '#thumbnail' do
    context 'when valid' do
      let(:comic) do
        Comic.new(
          'thumbnail' => { 'path' => 'http://hu.lk/file', 'extension' => 'jpg' }
        )
      end
      subject(:thumbnail) { comic.thumbnail }
      it { is_expected.to eq 'http://hu.lk/file.jpg' }
    end

    context 'when not valid' do
      let(:comic) { Comic.new }
      subject(:thumbnail) { comic.thumbnail }
      it { is_expected.to eq 'Image: Not Found' }
    end
  end
end
