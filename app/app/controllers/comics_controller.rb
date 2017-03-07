class ComicsController < ApplicationController
  def index
    @api = MarvelApiClient.new
    @api.perform(params.permit([:offset]).to_h.symbolize_keys)
    @offset = params[:offset] || 0
    @comics = @api.comics
    render json: { offset: @offset, comics: @comics, list: @favorite_list.list }
  end
end
