class User < ActiveRecord::Base
  attr_accessible :username, :email
  validates :username, :email, :presence => true

  has_many :short_urls
  has_many :visits
  has_many :comments
end