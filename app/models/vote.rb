class Vote < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  before_create :one_vote

private
  def one_vote
    
  end
end
