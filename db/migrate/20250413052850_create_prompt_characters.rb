class CreatePromptCharacters < ActiveRecord::Migration[7.1]
  def change
    create_table :prompt_characters do |t|
      t.references :prompt, null: false, foreign_key: true
      t.references :character, null: false, foreign_key: true

      t.timestamps
    end
  end
end
