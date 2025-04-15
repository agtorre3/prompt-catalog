class CreatePromptRelationships < ActiveRecord::Migration[8.0]
  def change
    create_table :prompt_relationships do |t|
      t.references :prompt, null: false, foreign_key: true
      t.references :relationship, null: false, foreign_key: true

      t.timestamps
    end

    add_index :prompt_relationships, [:prompt_id, :relationship_id], unique: true
  end
end
