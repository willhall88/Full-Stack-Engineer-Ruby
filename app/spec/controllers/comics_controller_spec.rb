require 'rails_helper'

RSpec.describe ComicsController, type: :controller do
  before(:each) do
    Rails.cache.clear
  end

  describe 'GET #index' do
    context 'no params', :vcr do
      before (:each) do
        get :index
      end

      it { expect(assigns[:params]).to eq({}) }
      it { expect(assigns[:offset]).to eq 0 }
      it { expect(assigns[:comics].count).to eq 15 }
      it { expect(assigns[:favorite_list]).to be_instance_of(FavoriteCookie) }
      it { expect(assigns[:character_ids]).to eq [] }
      it { expect(response.content_type).to eq "application/json" }
    end

    context 'with valid params', :vcr do
      before (:each) do
        get :index, params: { offset: 15, characters: '1009351' }
      end

      it { expect(assigns[:offset]).to eq "15" }
      it { expect(assigns[:comics].count).to eq 15 }
      it { expect(assigns[:character_ids]).to eq '1009351' }
    end

    context 'with invalid params', :vcr do
      it { expect { get :index, params: { offset: 'bad', characters: 'wrong' } }.to raise_error(Exception) }
    end
  end

  describe 'GET #search' do
    context 'valid params', :vcr do
      before(:each) do
        get :search, params: { character: 'hulk' }
      end
      it { expect(assigns[:character_ids].count).to eq 9 }
      it { expect(assigns[:comics].count).to eq 15 }
      it { expect(response.content_type).to eq "application/json" }
    end
  end

  #     subject {assigns(:comics)}
  #     it 'has a list'do
  #       get :index, params: { limit: 1 }
  #       is_expected.to eq FavoriteCookie
  #     end
  #   end
  # end

  # describe 'GET #search' do
  #   context 'characters', :vcr do
  #     subject {assigns(:comics)}
  #     it 'has a list'do
  #       get :index, params: { limit: 1 }
  #       is_expected.to eq FavoriteCookie
  #     end
  #   end
end


# context 'with valid params' do
#     it 'redirects to show page'
#   end
#   context 'with invalid params' do
#     it 're-renders #new form'
#   end
#   context 'when params[:filter_by] == first_name' do
#     it 'filters results by first_name'
#   end
#   context 'when params[:filter_by] == last_name' do
#     it 'filters results by last_name'
#   end

