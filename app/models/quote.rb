require 'open-uri'

class Quote < ActiveRecord::Base

  belongs_to :batch

  after_create do |q|
    quote_obj = JSON.parse(open("http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json").read)
    q.text = quote_obj["quoteText"]
    q.author = quote_obj["quoteAuthor"]
  end

end