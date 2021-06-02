class AddUserIdToExplorers < ActiveRecord::Migration[6.1]
  def change
    add_column :explorers, :user_id, :integer
    add_index :explorers, :user_id
  end
end
