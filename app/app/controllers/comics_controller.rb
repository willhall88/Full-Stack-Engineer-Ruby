class ComicsController < ApplicationController
  def index
    @comics = ComicFetch.new.result_data
  end
end
