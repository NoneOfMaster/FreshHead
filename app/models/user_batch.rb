class UserBatch < ActiveRecord::Base
  belongs_to :user
  belongs_to :batch

  def completed
    self.update(complete: 1)
  end

end
