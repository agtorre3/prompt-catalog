class PromptRelationship < ApplicationRecord
  belongs_to :prompt
  belongs_to :relationship
end
