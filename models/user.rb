require './socialnetwork_app'

# require 'bcrypt'

class User < ActiveRecord::Base
  # include BCrypt

  validates_presence_of :username
  validates_presence_of :password
  validates_uniqueness_of :username

  has_many :posts

  # def password
  #   @password ||= Password.new(password_hash)
  # end

  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_hash = @password
  # end

end
