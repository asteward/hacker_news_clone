class Post < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  has_many :comments
  validates :title, presence: true
  validates :link, presence: true
  validates :user_id, presence: true
end
