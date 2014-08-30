class ReviseComments < ActiveRecord::Migration
  def change
    add_column :comments, :user_id, :integer
    remove_column :comments, :commentable_id, :integer
    remove_column :comments, :commentable_type, :string
  end
end
