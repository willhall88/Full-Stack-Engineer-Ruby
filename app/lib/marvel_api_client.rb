# Fetch Comic data from Marvel API
class MarvelApiClient
  DEFAULTS = { orderBy: '-onsaleDate', limit: 15, offset: 0 }

  attr_reader :comics, :options

  def initialize(params = {})
    @server = Marvelite::API::Client.new(
      public_key: ENV['MARVEL_API_PUBLIC_KEY'],
      private_key: ENV['MARVEL_API_PRIVATE_KEY']
    )
    @options = DEFAULTS.merge(params)
  end

  def perform
    @comics = Rails.cache.fetch(cache_key, expires_in: 24.hours) do
      result_data = @server.comics(@options)
      process_data(result_data)
    end
  end

  def process_data(result_data)
    comics_data = result_data['data']['results']
    comics_data.map do |comic_data|
      Comic.new(comic_data).build
    end
  end

  private

  def cache_key
    Digest::MD5.hexdigest(@options.to_s)
  end
end
