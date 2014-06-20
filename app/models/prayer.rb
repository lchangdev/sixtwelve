class Prayer < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true

  has_many :comments
  belongs_to :user
  belongs_to :group
end
