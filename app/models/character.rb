class Character < ApplicationRecord
  has_many :prompt_characters
  has_many :prompts, through: :prompt_characters
end
