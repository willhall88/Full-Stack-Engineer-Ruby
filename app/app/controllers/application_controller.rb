class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :load_favorites, :load_api

  def index
    @api.perform(params.permit([:offset]).to_h.symbolize_keys)
    @offset = params[:offset] || 0
    @comics = @api.comics
    { offset: @offset, comics: @comics, list: @favorite_list.list }
  end

  protected

  def load_favorites
    @favorite_list ||= FavoriteCookie.new(cookies)
  end

  def load_api
    @api = MarvelApiClient.new
  end
end
