class ComicsController < ApplicationController
  def index
    @api = MarvelApiClient.new(params.permit([:offset]).to_h.symbolize_keys)
    @api.perform
    @offset = params[:offset] || 0
    @comics = @api.comics
    render json: { offset: @offset, comics: @comics }
  end
end
