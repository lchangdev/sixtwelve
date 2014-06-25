class Group < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :members, dependent: :destroy
  has_many :prayers, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :users, through: :members
end
