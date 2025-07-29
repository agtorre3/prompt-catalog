class CreatePromptCharacterTraits < ActiveRecord::Migration[8.0]
  def change
    create_table :prompt_character_traits do |t|
      t.references :prompt, null: false, foreign_key: true
      t.references :character_trait, null: false, foreign_key: true

      t.timestamps
    end

    add_index :prompt_character_traits, [:prompt_id, :character_trait_id], unique: true
  end
end
