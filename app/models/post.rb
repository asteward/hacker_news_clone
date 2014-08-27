class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :link, presence: true
  before_create :set_votes
  after_touch :adjust_rank

private
  def set_votes
    self.votes = 0
  end

  def adjust_rank
    self.rank = self.votes
  end
end
