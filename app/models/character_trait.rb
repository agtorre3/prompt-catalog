class CharacterTrait < ApplicationRecord
  belongs_to :character
  belongs_to :trait

  validates :character_id, uniqueness: { scope: :trait_id }

  def name
    "#{character.name.titleize.remove(" ")}!#{trait.name.titleize}"
  end
end
