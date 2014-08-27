class Post < ActiveRecord::Base
  has_many :votes
  validates :title, presence: true
  validates :link, presence: true
  after_touch :adjust_rank

private

  def adjust_rank
    self.rank = self.votes.length
  end
end
