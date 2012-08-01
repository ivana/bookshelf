require 'open-uri'
require 'json'
require 'nibbler/json'

class GoogleBook < NibblerJSON
  element :id
  element '.volumeInfo.title' => :title
  element '.volumeInfo.subtitle' => :subtitle
  elements '.volumeInfo.authors' => :authors
  element '.volumeInfo.imageLinks.thumbnail' => :coverLink
  element '.volumeInfo.imageLinks.smallThumbnail' => :coverLinkSmall
  element '.volumeInfo.canonicalVolumeLink' => :gBooksLink

  def self.search(query)
    search_params = {
      key: Rails.application.config.google.api_key,
      maxResults: 5,
      fields: 'items(id,volumeInfo(authors,canonicalVolumeLink,imageLinks(smallThumbnail,thumbnail),subtitle,title))',
      q: query
    }
    search_url = "https://www.googleapis.com/books/v1/volumes?#{search_params.to_query}"

    search_result = BooksSearch.parse open(search_url).read
    search_result.books
  end
end

class BooksSearch < NibblerJSON
  elements '.items' => :books, :with => GoogleBook
end
