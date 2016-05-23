require 'open-uri'

class News < ActiveRecord::Base
  belongs_to :batch

  after_create :set_news_data

  def set_news_data
    http = "https://api.nytimes.com/svc/topstories/v2/world.json?api-key=#{Rails.application.secrets.NYT_KEY}"
    news = JSON.parse(open(http).read)["results"][0]
    self.title = news["title"]
    self.abstract = news["abstract"]
    self.url = news["url"]
  end

end
