require 'open-uri'

class Poem < ActiveRecord::Base

  belongs_to :batch

  before_save do |p|
    p.get_from_poetry_db
    # can randomize between both dbs, and also default to poetry.net if poetrydb fails
    # p.get_from_poetry_dot_net
  end

  def get_from_poetry_dot_net

  end

  def get_from_poetry_db
    # to make sure this poem isn't already in the db - add to test
    while self.poem == nil || Poem.where(:poem => self.poem).count > 0  
      line_count = rand(3..11)
      full_poems_obj = JSON.parse(open("http://poetrydb.org/linecount/#{line_count}:abs/all").read)
      ## write something here to abort a failure and switch to poetry.net if poetrydb is not responding
      single_poem_obj = full_poems_obj.sample
      self.title = single_poem_obj["title"]
      self.poet = single_poem_obj["author"]
      self.poem = single_poem_obj["lines"].join("<br>")
    end
  end

end