class Post < ActiveRecord::Base
  validates :body, :presence => true
  validates :title, :presence => true
  validates :author, :presence => true
end
