# Model to handle raw comicbook data
class Comic
  def initialize(data = {})
    @data = data
  end

  def title
    @data['title'] || 'Title: Not Found'
  end

  def thumbnail
    return 'Image: Not Found' unless @data['thumbnail']
    @data['thumbnail'].values.join('.')
  end
end
