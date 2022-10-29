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
  
  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @scenario = Scenario.where("title LIKE?", "#{word}")
    elsif search == "partial_match"
      @scenario = Scenario.where("title LIKE?","%#{word}%")
    else
      @user = User.all
    end
  end
  
end

