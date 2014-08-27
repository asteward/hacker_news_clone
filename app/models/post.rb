class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :link, presence: true
  before_create :set_votes

private
  def set_votes
    self.votes = 0
  end
end
