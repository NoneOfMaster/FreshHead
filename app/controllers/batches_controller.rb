class BatchesController < ApplicationController

  def show
    today = [Date.today.beginning_of_day..Date.today.end_of_day]
    # figure out why below preferable syntax does not work
    # @batch = Batch.find_by("created_at = ?", today)
    @batch = Batch.find_by(:created_at => today)
  end


end
