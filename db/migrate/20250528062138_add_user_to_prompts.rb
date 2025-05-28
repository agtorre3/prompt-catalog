class AddUserToPrompts < ActiveRecord::Migration[8.0]
  def change
    # First add the column as nullable
    add_reference :prompts, :user, null: true, foreign_key: true

    # Update existing records (assuming you want to assign them to the first user)
    reversible do |dir|
      dir.up do
        if User.exists?
          first_user = User.first
          Prompt.where(user_id: nil).update_all(user_id: first_user.id)
        end
      end
    end

    # Make the column non-nullable
    change_column_null :prompts, :user_id, false
  end
end
