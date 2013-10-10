class CreatePost < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.string :content
      t.belongs_to :user
      t.timestamps
    end
  end

  def down
    drop_table :posts
  end
end
