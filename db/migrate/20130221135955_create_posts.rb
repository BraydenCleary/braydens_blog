class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |p|
      p.text :body
      p.string :title
      p.string :author
      p.integer :like_count, :default => 0
      t.timestamps
    end
  end
end
