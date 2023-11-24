require 'rest-client'
module Services
  class FetchArticles

    def initialize(url)
      @url = url
    end

    def fetch_data
      resp = RestClient.get(@url)
      data = JSON.parse(resp)

      data['articles'].each do |article|
        source = Source.create(name: article['source']['name'], id_name: article['source']['id'])
        Article.create(source: source, author: article['author'], title: article['title'], description: article['description'], url: article['url'], url_to_image: article['url_to_image'], published_at: article['published_at'], content: article['content'])
      end
    end
  end 
end