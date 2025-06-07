class Relationship < ApplicationRecord
    enum :relationship_type, %i[friendly romantic]
    
    has_many :relationship_members, dependent: :destroy
    has_many :characters, through: :relationship_members

    accepts_nested_attributes_for :relationship_members, allow_destroy: true

    validates :relationship_type, presence: true
    validate :at_least_two_characters

    private

    def at_least_two_characters
        if relationship_members.size < 2
            errors.add(:characters, "must have at least two members")
        end
    end
end
