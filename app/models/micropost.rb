class Micropost < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 3

  attr_accessible :content
  belongs_to :user

  validates :content, :presence => true, :length => {:maximum => 140}
  validates :user_id, :presence => true

  default_scope :order => 'microposts.created_at DESC'
end
