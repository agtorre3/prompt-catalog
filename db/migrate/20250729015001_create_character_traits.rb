class CreateCharacterTraits < ActiveRecord::Migration[8.0]
  def change
    create_table :character_traits do |t|
      t.references :character, null: false, foreign_key: true
      t.references :trait, null: false, foreign_key: true

      t.timestamps
    end

    add_index :character_traits, [:character_id, :trait_id], unique: true
  end
end
