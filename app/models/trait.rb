class Trait < ApplicationRecord
  has_many :character_traits, dependent: :destroy
  has_many :characters, through: :character_traits

  has_many :prompt_character_traits, dependent: :destroy
  has_many :prompts, through: :prompt_character_traits

  validates :name, presence: true, uniqueness: true
end
