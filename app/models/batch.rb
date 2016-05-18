class Batch < ActiveRecord::Base

  has_one :quote 
  has_one :fact
  has_one :poem

  before_save :set_batch_data

  def set_batch_data
    self.quote = Quote.new
    self.fact = Fact.new
    self.poem = Poem.new
  end

  def cli_details
    puts "TODAY'S BATCH SUCCESSFULLY CREATED"
    puts "Date: #{self.created_at.strftime("%B, %d, %Y")}"
    puts "Quote: #{self.quote.text}"
    puts "Quote Author: #{self.quote.author}"
    puts "Fact: #{self.fact.text}"
    puts "Poem: #{self.poem.title}"
    puts "by #{self.poem.poet}"
    puts "#{self.poem.poem}"
  end  

end
