class ComicsController < ApplicationController
  def index
    @api = MarvelApiClient.new(params.permit([:offset]).to_h.symbolize_keys)
    @api.perform
    @offset = params[:offset] || 0
    @comics = @api.comics
    @data = {offset: @offset, comics: @comics}
    render json: @data
  end
end
