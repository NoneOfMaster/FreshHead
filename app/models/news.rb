require 'open-uri'

class News < ActiveRecord::Base
  belongs_to :batch

  after_create :set_news_data

  def set_news_data
    ## TO DO: fully impliment the strategy of checking in secrets.yml with everything moved
    ## to env vars through application.yml (Figaro gem), then updating env vars to Heroku via Config Vars
    # http = "https://api.nytimes.com/svc/topstories/v2/world.json?api-key=#{Rails.application.secrets.NYT_KEY}"
    ## ... but for now the below:
    http = "https://api.nytimes.com/svc/topstories/v2/world.json?api-key=#{ENV["NYT_KEY"]}"
    news = JSON.parse(open(http).read)["results"][0]
    self.title = news["title"]
    self.abstract = news["abstract"]
    self.url = news["url"]
    self.save
  end

end
