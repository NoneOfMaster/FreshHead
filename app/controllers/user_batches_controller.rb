class UserBatchesController < ApplicationController

  def update
    ### the below three lines can be broken out into private methods
    @user_batch = UserBatch.find(params[:id])
    @user_batch.increment(:user_progress, by = 1)
    @user_batch.save
    render :json => {"progress" => @user_batch.user_progress, "content" => next_content}
  end

  private


  def next_content
    batch = Batch.find(@user_batch.batch_id)
    ### this code is so similar to set_cotent method in batches_controller that maybe it could be refactored or modularized
    case @user_batch.user_progress
    when 0
      {"content1" => batch.fact.text, "content2" => "", "content3" => ""}
    when 1
      {"content1" => batch.quote.text, "content2" => batch.quote.author, "content3" => ""}
    when 2
      {"content1" => batch.poem.title, "content2" => batch.poem.poem, "content3" => batch.poem.poet}
    when 3
      {"content1" => batch.news.title, "content2" => batch.news.abstract, "content3" => batch.news.url}
    else
      ## this can draw from an array of affirmations
      {"content1" => "YAY YOU DID IT! See you tomorrow.", "content2" => "", "content3" => ""}
    end
  end

end