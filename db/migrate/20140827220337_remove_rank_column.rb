class RemoveRankColumn < ActiveRecord::Migration
  def change
    remove_column :posts, :rank, :integer
  end
end
