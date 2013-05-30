class Tag < ActiveRecord::Base
  attr_accessible :tag_topic_id, :short_url_id
  validates :tag_topic, :short_url, :presence => true

  belongs_to :short_url
  belongs_to :tag_topic
end