class Visit < ActiveRecord::Base
  attr_accessible :short_url_id, :user_id
  validates :short_url_id, :user_id, :presence => true

  belongs_to :user
  belongs_to :short_url
end