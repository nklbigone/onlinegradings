class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :course
  has_many :user, through: :course
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :national_id, presence:true
  validates :address, presence:true
  validates :level, presence:true
  validates :classes, presence:true
  validates :email, presence:true
end
