class CreatePostTags < ActiveRecord::Migration
  def change
    create_table :post_tags do |p|
      p.integer :post_id
      p.integer :tag_id
      p.timestamps
    end
  end
end
