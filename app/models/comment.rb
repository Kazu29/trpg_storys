class Comment < ApplicationRecord
  
  belongs_to :user
  belongs_to :scenario
  
  validates :review, presence: true,length:{maximum:100}
  
end
