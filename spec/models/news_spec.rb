require 'rails_helper'

RSpec.describe News, type: :model do
  
  it 'has title, abstract, url' do
    news = News.create
    expect(news.title).to be_a(String)
    expect(news.abstract).to be_a(String)
    expect(news.url).to be_a(String)
    news.destroy
  end

end
