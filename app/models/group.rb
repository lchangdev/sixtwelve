class Group < ActiveRecord::Base

  has_many :members
  has_many :prayers
  has_many :users, through: :members
  # accepts_nested_attributes_for :prayers

end


