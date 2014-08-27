class CreateComment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text    "content"
      t.belongs_to :post
      t.integer "commentable_id"
      t.string  "commentable_type"
    end
  end
end
