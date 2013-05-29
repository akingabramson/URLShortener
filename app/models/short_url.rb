class ShortUrl < ActiveRecord::Base
  attr_accessible :short_url, :user_id, :long_url_id
  validates :short_url, :user_id, :long_url_id, :presence => true

  belongs_to :long_url
  belongs_to :user
  has_many :visits
  has_many :comments
  has_many :tags
  has_many :tag_topics, :through => :tags
end