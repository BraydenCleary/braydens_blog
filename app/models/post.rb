class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags #don't plan on adding columns to the join table

  validates :body, :presence => true
  validates :title, :presence => true
  validates :author, :presence => true
end
