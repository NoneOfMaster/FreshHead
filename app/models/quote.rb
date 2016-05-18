require 'open-uri'

class Quote < ActiveRecord::Base

  belongs_to :batch
  
  attr_accessor :text, :author

  before_save do |q|
    quote_obj = JSON.parse(open("http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json").read)
    q.quote_text = quote_obj["quoteText"]
    q.quote_author = quote_obj["quoteAuthor"]
  end

end