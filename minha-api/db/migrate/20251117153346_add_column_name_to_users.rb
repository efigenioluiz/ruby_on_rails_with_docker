class AddColumnNameToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :nome, :string
  end
end
