class ComicsController < ApplicationController
  def index
    @api = MarvelApiClient.new(params.except(:action, :controller))
    @api.perform

    @comics = @api.comics
  end
end
