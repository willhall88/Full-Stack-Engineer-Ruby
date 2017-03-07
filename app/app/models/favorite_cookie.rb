# Model to handle Favorite list
class FavoriteCookie
  def initialize(cookie)
    @cookie = cookie
    @cookie[:comic_ids] ||= JSON.generate([])
    list
  end

  def list
    JSON.parse(@cookie[:comic_ids])
  end

  def toggle(id)
    list.include?(id) ? remove(id) : add(id)
  end

  def add(id)
    comic_ids ||= list
    comic_ids << id
    set_cookie(comic_ids)
  end

  def remove(id)
    comic_ids ||= list
    comic_ids.delete(id)
    set_cookie(comic_ids)
  end

  private

  def set_cookie(comic_ids)
    @cookie[:comic_ids] = { value: JSON.generate(comic_ids), expires: 1.month.from_now }
  end
end
