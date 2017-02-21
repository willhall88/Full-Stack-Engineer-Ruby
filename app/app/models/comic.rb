# Model to handle raw comicbook data
class Comic
  def initialize(data = {})
    @data = data
  end

  def title
    @data['title'] || 'Title: Not Found'
  end

  def thumbnail
    return missing_image_url unless @data['thumbnail']
    @data['thumbnail'].values.join('.')
  end

  def missing_image_url
    'http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg'
  end

  def id
    @data['id']
  end

  def build
    {
      id: id,
      title: title,
      thumbnail: thumbnail
    }
  end
end
