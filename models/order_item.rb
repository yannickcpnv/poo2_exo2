class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  scope :bulk, ->(quantity = 100) { where('quantity >= ?', quantity) }

  validates :product, presence: true
  validates :quantity, numericality: { greater_than: 0 }

  before_create { self.item_price = product.price }
end
