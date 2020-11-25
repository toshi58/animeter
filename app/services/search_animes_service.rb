class SearchAnimesService
  def self.search(search)
    if search != ""
      Anime.where('name or furigana LIKE(?)', "%#{search}%")
    else
      Anime.all
    end
  end
end