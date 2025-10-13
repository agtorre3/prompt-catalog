class Tag < ApplicationRecord
  belongs_to :tag_category

  has_many :prompt_tags, dependent: :destroy
  has_many :prompts, through: :prompt_tags

  validates :name, presence: true, uniqueness: { scope: :tag_category_id }

  scope :visible, -> { where.not(tag_category_id: TagCategory.find_by(name: "NSFW").id)
                      .where.not(tag_category_id: TagCategory.find_by(name: "Warnings").id)
                      .where.not(tag_category_id: TagCategory.find_by(name: "Character").id) }
end
