class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  scope :bulk, ->(quantity = 100) { where('quantity >= ?', quantity) }

  validates :product, :order, presence: true
  validates :quantity, numericality: { greater_than: 0, only_integer: true }

  before_create { self.item_price = self.product.price }

  # @return [BigDecimal]
  def price
    self.item_price * self.quantity
  end
end
