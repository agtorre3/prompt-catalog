class AddExternalIdToCharacters < ActiveRecord::Migration[7.1]
  def change
    add_column :characters, :external_id, :uuid
  end
end
