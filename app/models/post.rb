class Post < ActiveRecord::Base
  has_many :votes
  has_many :comments, :as => :commentable
  validates :title, presence: true
  validates :link, presence: true
end
