class PromptCharacter < ApplicationRecord
  belongs_to :prompt
  belongs_to :character
end
