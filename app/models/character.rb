class Character < ApplicationRecord
  has_many :prompt_characters
  has_many :prompts, through: :prompt_characters
  
  has_many :relationship_members
  has_many :relationships, through: :relationship_members
end
