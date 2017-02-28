require 'rails_helper'

RSpec.describe ComicsController, type: :controller do
  describe 'GET #index' do
    context 'favorite list', :vcr do
      subject { assigns(:favorite_list).class }
      it 'has a list' do
        get :index
        is_expected.to eq FavoriteCookie
      end
    end
  end
end
