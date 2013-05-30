class User < ActiveRecord::Base
  attr_accessible :username, :email
  validates :username, :email, :presence => true
  validates :username, :email, :uniqueness => true

  has_many :short_urls
  has_many :visits
  has_many :comments

  def add_link(long_url, title, tag_topic = nil)
    new_long = LongUrl.create(:long_url => long_url, :title => title)
    short_url = ShortUrl.create(:user_id => self.id, :long_url_id => new_long.id)
    tag_link(tag_topic, short_url) if tag_topic
    short_url.short_url
  end

  def tag_link(tag_topic, short_url)
    tag_topic = TagTopic.where(:tag_topic => tag_topic).first

    Tag.create(:tag_topic_id => tag_topic.id, :short_url_id => short_url.id)
  end

  def links_submitted
    links_submitted = []
    self.short_urls.each do |short_url|
      links_submitted << short_url.short_url
    end
    links_submitted
  end

  def visit_link(short_url)
    ShortUrl.where(:short_url = short_url).visit(self.id)
  end

end