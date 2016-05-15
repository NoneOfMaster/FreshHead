class User < ActiveRecord::Base

  validates_uniqueness_of :user_name, :email
  validates_presence_of :user_name, :email
  
  has_secure_password
end
