require 'open-uri'
require 'nokogiri'

class Poem < ActiveRecord::Base

  belongs_to :batch

  before_save do |p|
    # to make sure this poem isn't already in the db - be sure to test
    while self.poem == nil || Poem.where(:poem => self.poem).count > 0 
      p.get_from_poetry_db
    end
  end

  def get_from_poetry_db
    line_count = rand(3..11)
    http = "http://poetrydb.org/linecount/#{line_count}:abs/all"
    begin
      ## any error or lag of 15 seconds falls back to poems.com
      @full_poems_obj = JSON.parse(open(http, {:read_timeout => 15}).read) 
    rescue
      get_from_poems_dot_com
    else
      puts "from Poetrydb.org"
      single_poem_obj = @full_poems_obj.sample
      self.title = single_poem_obj["title"]
      self.poet = single_poem_obj["author"]
      self.poem = single_poem_obj["lines"].join("<br>")
    end
  end

  def get_from_poems_dot_com
    puts "from Poems.com"
    html = open("http://poems.com/today.php")
    poem_obj = Nokogiri::HTML(html)
    self.title = poem_obj.css("#page_title").text
    self.poet = poem_obj.css("#byline").text
    self.poem = poem_obj.css("#poem").text.gsub(/\n/, "<br>")
  end

end