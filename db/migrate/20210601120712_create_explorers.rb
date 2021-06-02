class CreateExplorers < ActiveRecord::Migration[6.1]
  def change
    create_table :explorers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :twitter

      t.timestamps
    end
  end
end
