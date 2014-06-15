class Prayer < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  # need to add model level validation for uniqueness for title

  has_many :comments
  belongs_to :user
end
