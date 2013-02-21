class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |p|
      p.text :body, :null => false
      p.string :title, :null => false
      p.string :author, :null => false
      p.integer :like_count, :default => 0
      p.timestamps
    end
  end
end
