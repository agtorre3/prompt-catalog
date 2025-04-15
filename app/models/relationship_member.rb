class RelationshipMember < ApplicationRecord
  belongs_to :character
  belongs_to :relationship
end
