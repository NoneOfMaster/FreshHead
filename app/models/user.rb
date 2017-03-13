class User < ActiveRecord::Base

  has_many :user_batches
  has_many :batches, through: :user_batches

  validates_uniqueness_of :user_name, :email
  validates_presence_of :user_name, :email

  has_secure_password

  def get_stats

    ordered_complete_batches = self.user_batches.where(complete: true).order(:created_at)
    total_completed = ordered_complete_batches.count

    streak_finder = {current_streak: 0, longest_streak: 0, last_date: 0}
    ordered_complete_batches.each {|batch|
      this_date = batch.created_at.to_date
      last_date = streak_finder[:last_date]
      if last_date != 0

        diff = (this_date - last_date).to_i

        if diff == 1
          streak_finder[:current_streak] = streak_finder[:current_streak] + 1
        else
          streak_finder[:current_streak] = 1
        end

        streak_finder[:longest_streak] = [streak_finder[:current_streak],streak_finder[:longest_streak]].max
        streak_finder[:last_date] = this_date

      else
        streak_finder[:current_streak] = 1
        streak_finder[:longest_streak] = 1
        streak_finder[:last_date] = this_date
      end
    }

    # return total, current, longest
    {
      total_complete: total_completed,
      longest_streak: streak_finder[:longest_streak],
      current_streak: streak_finder[:current_streak]
    }

  end

end
