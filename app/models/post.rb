class Post < ActiveRecord::Base
  has_many :votes
  validates :title, presence: true
  validates :link, presence: true
end
