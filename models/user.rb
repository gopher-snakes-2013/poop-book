require './socialnetwork_app'

class User < ActiveRecord::Base
  validates_presence_of :username
  validates_presence_of :password
  validates_uniqueness_of :username

  has_many :posts
end