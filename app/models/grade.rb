class Grade < ApplicationRecord
  belongs_to :course
  belongs_to :user
  has_many  :comments
  validates :course, presence:true
  validates :user, presence:true
  validates :mark, presence:true
  paginates_per 3
end
