class User < ActiveRecord::Base

  has_many :user_batches
  has_many :batches, through: :user_batches

  validates_uniqueness_of :user_name, :email
  validates_presence_of :user_name, :email

  has_secure_password
end
