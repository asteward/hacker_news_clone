class Post < ActiveRecord::Base
  has_many :votes
  validates :title, presence: true
  validates :link, presence: true
  before_create :set_rank

  def self.adjust_rank
    Post.all.each do |post|
      post.rank = post.votes.length
    end
  end
end
