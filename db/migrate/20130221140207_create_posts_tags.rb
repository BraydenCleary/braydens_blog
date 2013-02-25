class CreatePostsTags < ActiveRecord::Migration
  def change
    create_table :posts_tags do |p|
      p.integer :post_id
      p.integer :tag_id
    end
  end
end
