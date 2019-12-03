class Grade < ApplicationRecord
  belongs_to :course
  belongs_to :user
  
  validates :course, presence:true
  validates :user, presence:true
  validates :mark, presence:true
end
