class CharacterTrait < ApplicationRecord
  belongs_to :character
  belongs_to :trait

  validates :character_id, uniqueness: { scope: :trait_id }
end
