class Favorite < ApplicationRecord
  
  belongs_to :user
  belongs_to :scenario
  
  validates :scenario_id, uniqueness: {scope: :user_id}
  
end
