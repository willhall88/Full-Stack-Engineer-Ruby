class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @api = MarvelApiClient.new(params.except(:action, :controller))
    @api.perform

    @comics = @api.comics
  end
end
