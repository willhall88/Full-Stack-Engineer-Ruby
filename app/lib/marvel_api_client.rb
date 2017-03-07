# Fetch Comic data from Marvel API
class MarvelApiClient
  DEFAULTS = { orderBy: '-onsaleDate', limit: 15, offset: 0 }

  attr_reader :comics, :options

  def initialize(params = {})
    @server = Marvelite::API::Client.new(
      public_key: ENV['MARVEL_API_PUBLIC_KEY'],
      private_key: ENV['MARVEL_API_PRIVATE_KEY']
    )
  end

  def perform(params = {})
    @options = DEFAULTS.merge(params)
    @comics = Rails.cache.fetch(cache_key(@options), expires_in: 24.hours) do
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

  def search_characters(search_term)
    character_ids = Rails.cache.fetch(cache_key(search_term), expires_in: 24.hours) do
      character_data = @server.characters(nameStartsWith: search_term)
      character_data.dig('data', 'results').map { |character| character['id'] }
    end
  end

  private

  def cache_key(params)
    Digest::MD5.hexdigest(params.to_s)
  end
end
