class ComicsController < ApplicationController
  before_action :permitted_params

  def index
    @api.perform(@params)
    load_render
  end

  def search
    @character_ids = @api.search_characters(@character)
    @api.perform(characters: @character_ids)
    load_render
  end

  private

  def load_render
    @comics = @api.comics
    if @comics.is_a?(Hash) && @comics[:error]
      error = @comics[:error]
      reset_params
      raise Exception.new(error)
    end
    render json: {
      offset: @offset,
      comics: @comics,
      list: @favorite_list.list,
      characters: @character_ids
    }
  end

  def reset_params
    @offset = 0
    @character_ids = []
    @comics = []
  end

  def permitted_params
    @params ||= params.permit(:offset, :characters, :character)
                      .to_h
                      .symbolize_keys
    @offset = @params[:offset] || 0
    @character_ids = @params[:characters] || []
    @character = @params[:character] || ''
  end
end
