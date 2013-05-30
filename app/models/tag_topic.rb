class TagTopic < ActiveRecord::Base
  attr_accessible :tag_topic
  validate :tag_topic, :presence => true

  has_many :tags
  has_many :short_urls, :through => :tags

  def most_popular_link
    self.short_urls.sort_by {|short_url| short_url.uniques_count}.last
  end
end