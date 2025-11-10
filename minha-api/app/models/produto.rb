class Produto < ApplicationRecord

  belogns_to :categoria, optional: true
  # PRODUTO, PRODUTO_CARRINHO, CARRINHO, gerenciar vendas, estudar mais sobre restfull,
  # obrigatoriedade de relacionamentos entre tabelas, validações, callbacks, etc.

  validates :nome, presence: true
  validates :preco, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :quantidade, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
