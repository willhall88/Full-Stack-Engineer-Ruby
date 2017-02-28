require 'rails_helper'

RSpec.describe FavoritesController, type: :controller do

  describe 'GET #toggle' do
    let(:favorite_cookie) { FavoriteCookie.new(cookies) }
    let(:comic_id) { '1234' }

    context 'adding comics' do
      it 'adds to a cookie' do
        expect(favorite_cookie.list).to eq []
        post :toggle, params: {id: comic_id}, format: :json
        expect(favorite_cookie.list).to eq [comic_id]
      end
    end

    context 'adding comics' do
      it 'adds to a cookie' do
        favorite_cookie.add('1234')
        expect(favorite_cookie.list).to eq ['1234']
        post :toggle, params: {id: comic_id}, format: :json
        expect(favorite_cookie.list).to eq []
      end
    end
  end

end
