class Comment < ActiveRecord::Base
  validates :description, presence: true

  belongs_to :prayer
  belongs_to :user
end
