class LongUrl < ActiveRecord::Base
  attr_accessible :long_url, :title
  validates :long_url, :presence => true

  has_many :short_urls
end