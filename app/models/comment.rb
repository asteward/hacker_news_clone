class Comment < ActiveRecord::Base
  belongs_to :post
  has_many :comments
  validates :content, presence: true
end
