class ShortUrl < ActiveRecord::Base
  attr_accessible :short_url, :user_id, :long_url_id
  validates :user, :long_url, :presence => true
  #don't check for foreign ID, check for associated object (user_id vs user)
  #validate :user, :uniqueness => true
  #validate :short_url, :length => {:maximum => 255, :too_long => "%{count}                 characters is the maximum allowed"}
  #

  belongs_to :long_url
  belongs_to :user
  has_many :visits
  has_many :comments
  has_many :tags
  has_many :tag_topics, :through => :tags

  before_create :generate_short_url

  def generate_short_url
    self.short_url = SecureRandom.urlsafe_base64
  end

  def visit(current_user_id)
    display_comments
    Visit.create(:short_url_id => self.id, :user_id => current_user_id)
    Launchy.open(self.long_url.long_url)
  end

  def visit_count
    self.visits.count
  end

  def uniques_count
    self.visits.select("DISTINCT user_id").count
  end

  def recent_visit_count
    self.visits.where("updated_at > ?", Time.now - 10.minutes).count
  end

  def display_comments
    self.comments.each{|comment| p comment.comment}
  end

  def comment(current_user_id, comment)
    Comment.create(:user_id => current_user_id, :comment => comment,
                  :short_url_id => self.id)
  end
end