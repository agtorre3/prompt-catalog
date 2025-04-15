class CreateRelationshipMembers < ActiveRecord::Migration[8.0]
  def change
    create_table :relationship_members do |t|
      t.references :character, null: false, foreign_key: true
      t.references :relationship, null: false, foreign_key: true

      t.timestamps
    end

    add_index :relationship_members, [:relationship_id, :character_id], unique: true
  end
end
