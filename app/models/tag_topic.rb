class TagTopic < ActiveRecord::Base
  attr_accessible :tag_topic
  validate :tag_topic, :presence => true

  has_many :tags
  has_many :short_urls, :through => :tags
end