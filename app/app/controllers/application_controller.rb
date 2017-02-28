class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :load_favorites

  def index
    @api = MarvelApiClient.new(params.permit([:offset]).to_h.symbolize_keys)
    @api.perform
    @offset = params[:offset] || 0
    @comics = @api.comics
    { offset: @offset, comics: @comics }
  end

  protected

  def load_favorites
    @favorite_list = FavoriteCookie.new(cookies)
  end
end
