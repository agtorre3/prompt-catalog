class Relationship < ApplicationRecord
    enum :relationship_type, %i[friendly romantic]
    
    has_many :relationship_members
    has_many :characters, through: :relationship_members
end
