class Scenario < ApplicationRecord
  
  belongs_to :user
  belongs_to :genre
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :title,presence:true,length:{maximum:100}
  validates :overview,presence:true,length:{maximum:100}
  validates :content,presence:true,length:{maximum:50000}
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
end

