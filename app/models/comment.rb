class Comment < ActiveRecord::Base
  attr_accessible :comment, :user_id, :short_url_id
  validates :comment, :user_id, :short_url_id, :presence => true
  
  belongs_to :short_url
  belongs_to :user
end