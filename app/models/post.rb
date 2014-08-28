class Post < ActiveRecord::Base
  has_many :votes
  has_many :comments
  validates :title, presence: true
  validates :link, presence: true
end
