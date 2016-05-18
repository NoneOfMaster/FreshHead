require 'open-uri'
require 'nokogiri'

class Fact < ActiveRecord::Base

  belongs_to :batch

  before_save do |f|
    html = open("http://www.fayd.org/api/fact.xml")
    fact_obj = Nokogiri::HTML(html)
    f.text = fact_obj.text
  end

end
