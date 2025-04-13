class Prompt < ApplicationRecord
  has_many :prompt_characters
  has_many :characters, through: :prompt_characters
end
