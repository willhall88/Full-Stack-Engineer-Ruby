# Fetch Comic data from Marvel API
class ComicFetch
  DEFAULTS = { orderBy: '-onsaleDate', limit: 1 }.freeze

  attr_reader :comic_results

  def initialize
    perform
  end

  def perform
    api = Marvelite::API::Client.new(
      public_key: ENV['MARVEL_API_PUBLIC_KEY'],
      private_key: ENV['MARVEL_API_PRIVATE_KEY']
    )

    @comic_results = api.comics(DEFAULTS)
  end

  def result_data
    @comic_results.data['results'][0]
  end
end
