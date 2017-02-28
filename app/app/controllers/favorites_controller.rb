class FavoritesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def toggle
  end
end
