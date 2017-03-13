class BatchesController < ApplicationController

  def show
    # scheduling for midnight to troubleshoot heroku memory usage
    # if Batch.last.created_at.to_date != Time.now.getutc.to_date
    #   Batch.create
    # end

    @batch = Batch.last
    if current_user
      set_user_batch
      ### below 2 lines can be broken out into private methods
      @path = user_batch_path(@user_batch.id)
      @progress = @user_batch.user_progress
      set_content
    else
      @progress = 0
      @path = login_path
    end 
  end

private

  def set_user_batch
    if !current_user.batches.include?(@batch)
      current_user.batches << @batch
    end
    @user_batch = current_user.user_batches.find_by({batch_id: @batch.id})
  end

  def set_content
    case @progress
    when 0
      @content1 = @batch.fact.text
    when 1
      @content1 = @batch.quote.text
      @content2 = @batch.quote.author
    when 2
      @content1 = @batch.poem.title
      @content2 = @batch.poem.poem
      @content3 = @batch.poem.poet
    when 3
      @content1 = @batch.news.title
      @content2 = @batch.news.abstract
      @content3 = @batch.news.url
    else
      ## this can draw from an array of affirmations
      @content1 = "YAY YOU DID IT! See you tomorrow."
    end
  end

  def user_batch_params
    params.require(:user_batch).permit(:user_progress)
  end

end
