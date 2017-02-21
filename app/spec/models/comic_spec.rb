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
      it 'show not found image' do
        is_expected.to eq 'http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg'
      end
    end
  end

  describe '#id' do
    context 'when valid' do
      let(:comic) { Comic.new('id' => '123') }
      subject(:id) { comic.id }
      it { is_expected.to eq '123' }
    end
  end

  describe '#build' do
    context 'when valid' do
      let(:comic) do
        Comic.new(
          'id' => '123',
          'thumbnail' => { 'path' => 'http://hu.lk/file', 'extension' => 'jpg' },
          'title' => 'Ant-Man'
        )
      end
      let(:result) do
        {
          id: '123',
          title: 'Ant-Man',
          thumbnail: 'http://hu.lk/file.jpg'
        }
      end

      subject(:build) { comic.build }
      it 'creates valic json object' do
        is_expected.to eq result
      end
    end
  end
end
