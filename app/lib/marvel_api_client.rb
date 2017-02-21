# Fetch Comic data from Marvel API
class MarvelApiClient
  DEFAULTS = { orderBy: '-onsaleDate', limit: 15 }

  attr_reader :result_data, :comics, :options

  def initialize(params = {})
    @server = Marvelite::API::Client.new(
      public_key: ENV['MARVEL_API_PUBLIC_KEY'],
      private_key: ENV['MARVEL_API_PRIVATE_KEY']
    )
    @options = DEFAULTS.merge(params)
  end

  def perform
    @result_data = @server.comics(@options)
    process_data(@result_data)
  end

  def process_data(result_data)
    comics_data = result_data['data']['results']
    @comics = comics_data.map do |comic_data|
      Comic.new(comic_data).build
    end
  end
end
