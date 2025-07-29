class Prompt < ApplicationRecord
  has_many :prompt_characters, dependent: :destroy
  has_many :characters, through: :prompt_characters

  has_many :prompt_relationships, dependent: :destroy
  has_many :relationships, through: :prompt_relationships

  has_many :prompt_tags, dependent: :destroy
  has_many :tags, through: :prompt_tags

  has_many :prompt_character_traits, dependent: :destroy
  has_many :character_traits, through: :prompt_character_traits

  belongs_to :user
end
