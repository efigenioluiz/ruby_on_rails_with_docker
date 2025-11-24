class Produto < ApplicationRecord

  validates :nome, presence: true
  validates :preco, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :quantidade, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
