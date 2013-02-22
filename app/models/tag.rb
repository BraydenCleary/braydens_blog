class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts #don't plan on adding columns to the join table

  validates :name, :presence => true
end
