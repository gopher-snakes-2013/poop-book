require './socialnetwork_app'

class Post < ActiveRecord::Base
  belongs_to :user
end