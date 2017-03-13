class Batch < ActiveRecord::Base

  has_many :user_batches
  has_many :users, through: :user_batches
  has_one :quote, dependent: :destroy
  has_one :fact, dependent: :destroy
  has_one :poem, dependent: :destroy
  has_one :news, dependent: :destroy

  after_create :set_batch_data

  def set_batch_data
    self.quote = Quote.create
    self.fact = Fact.create
    self.poem = Poem.create
    self.news = News.create # 100 request/day quota
  end

  def cli_details
    # removing to troubleshoot heroku memory usage
    # puts "TODAY'S BATCH SUCCESSFULLY CREATED"
    # puts "Date: #{self.created_at.strftime("%B, %d, %Y")}"
    # puts "Quote: #{self.quote.text}"
    # puts "Quote Author: #{self.quote.author}"
    # puts "Fact: #{self.fact.text}"
    # puts "Poem: #{self.poem.title}"
    # puts "by #{self.poem.poet}"
    # puts "#{self.poem.poem}"
    # puts "News: #{self.news.title}"
    # puts "Abstract: #{self.news.abstract}"
    # puts "URL: #{self.news.url}"
    # true
  end  

end
