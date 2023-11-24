class ArticlesController < ApplicationController
  def index
    @articles = Article.all

    if @articles.size == 0
      articles = Services::FetchArticles.new("https://newsapi.org/v2/everything?q=tesla&from=2023-10-24&sortBy=publishedAt&apiKey=ca66c29bcce24ec9b064fbbca84395ec")
      articles.fetch_data
    end
    @articles = Article.all
    render json: { status: 200, articles: @articles}
  end
end
