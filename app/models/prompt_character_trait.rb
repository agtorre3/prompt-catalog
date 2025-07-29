class PromptCharacterTrait < ApplicationRecord
  belongs_to :prompt
  belongs_to :character_trait

  validates :prompt_id, uniqueness: { scope: :character_trait_id }
end
