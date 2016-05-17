require 'open-uri'

class Quote < ActiveRecord::Base

  attr_accessor :text, :author

  def initialize
    quote = JSON.parse(open("http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json").read)
    @text = quote["quoteText"]
    @author = quote["quoteAuthor"]
  end

end