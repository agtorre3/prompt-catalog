class Relationship < ApplicationRecord
    enum :relationship_type, %i[friendly romantic]
end
