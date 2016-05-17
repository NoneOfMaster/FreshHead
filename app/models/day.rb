class Day < ActiveRecord::Base

  attr_accessor :date, :day, :month, :year, :quote, :poem, :news, :fact

  def initialize(date)
    @date = date
    @quote = Quote.new
  end

end
