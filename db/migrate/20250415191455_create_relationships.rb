class CreateRelationships < ActiveRecord::Migration[8.0]
  def change
    create_table :relationships do |t|
      t.string :relationship_type, null: false

      t.timestamps
    end
  end
end
