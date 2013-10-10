require './socialnetwork_app'

class User < ActiveRecord::Base
  has_many :posts
end