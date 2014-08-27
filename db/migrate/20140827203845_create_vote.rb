class CreateVote < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :post
    end
  end
end
