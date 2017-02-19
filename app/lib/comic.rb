# Fetch Comic data from Marvel API
class ComicFetch
  def perform
    api = Marvelite::API::Client.new(
      public_key: ENV['MARVEL_API_PUBLIC_KEY'],
      private_key: ENV['MARVEL_API_PRIVATE_KEY']
    )

    api.comics(
      orderBy: '-onsaleDate',
      limit: 1
    )
  end
end
