class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :scenarios, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :name, uniqueness: true, length: { minimum: 2, maximum: 20}
  
  validates :is_deleted, inclusion: { in: [true, false] }
  validates :admin, inclusion: { in: [true, false] }
  
end
