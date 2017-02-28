class FavoritesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def toggle
    @favorite_list = FavoriteCookie.new(cookies)
    @favorite_list.toggle(params[:id])
    render json: {}
  end
end