class Prompt < ApplicationRecord
  has_many :prompt_characters
  has_many :characters, through: :prompt_characters

  has_many :prompt_relationships
  has_many :relationships, through: :prompt_relationships
end
