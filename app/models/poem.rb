require 'open-uri'
require 'nokogiri'

class Poem < ActiveRecord::Base

  belongs_to :batch

  attr_accessor  :tries_at_api, :tries_allowed_at_api

  after_create do |p|
    p.tries_allowed_at_api = 6
    p.tries_at_api = 0
    p.get_from_poetry_db
    p.save
  end

  # limited supply ~190
  def get_from_poetry_db
    @tries_at_api += 1
    line_count = rand(3..11)
    http = "http://poetrydb.org/linecount/#{line_count}:abs/all"
    begin
      ## any error or lag of 15 seconds falls back to poems.com
      full_poems_obj = JSON.parse(open(http, {:read_timeout => 15}).read)
    rescue
      get_from_poems_dot_com
    else
      single_poem_obj = full_poems_obj.sample
      if Poem.where("title = ?", single_poem_obj['title']).count > 0 && @tries_at_api < @tries_allowed_at_api
        puts "#{tries_at_api} tries"
        get_from_poetry_db
      else
        puts "Poetrydb.org searches: #{tries_at_api} (this is the amount of samples checked, cut off at 5, doesn't mean the API is exhausted, just that so many samples are alraedy in the db... so it's probably getting close)"
        puts "Poem from Poetrydb.org"
        self.title = single_poem_obj["title"]
        self.poet = single_poem_obj["author"]
        self.poem = single_poem_obj["lines"].join("<br>")
      end
    end
  end

  def get_from_poems_dot_com
    puts "Poem from Poems.com"
    html = open("http://poems.com/today.php")
    poem_obj = Nokogiri::HTML(html)
    self.title = poem_obj.css("#page_title").text
    self.poet = poem_obj.css("#byline").text
    self.poem = poem_obj.css("#poem").text.gsub(/\n/, "<br>")
  end

end
