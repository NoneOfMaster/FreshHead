class Batch < ActiveRecord::Base

  has_one :quote

  before_save :set_batch_data

  def set_batch_data
    self.quote = Quote.new
  end

  def cli_details
    puts "TODAY'S BATCH SUCCESSFULLY CREATED"
    puts "Date: #{self.created_at.strftime("%B, %d, %Y")}"
    puts "Quote: #{self.quote.quote_text}"
    puts "Quote Author: #{self.quote.quote_author}"
  end  

end
