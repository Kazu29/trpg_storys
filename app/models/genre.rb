class Genre < ApplicationRecord
  
  has_many :scenarios
  
  validates:name, uniqueness: true, presence: true
  
end
