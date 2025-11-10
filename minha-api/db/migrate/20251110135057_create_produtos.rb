class CreateProdutos < ActiveRecord::Migration[8.1]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.float :preco
      t.text :descricao
      t.integer :quantidade

      t.timestamps
    end
  end
end
