class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  scope :bulk, ->(quantity = 100) { where('quantity >= ?', quantity) }

  validates :product, :order, presence: true
  validates :quantity, numericality: { greater_than: 0, only_integer: true }

  before_create { self.item_price = self.product.price }

  after_save do
    new_quantity = self.quantity
    old_quantity = self.attribute_before_last_save(:quantity).to_i

    if new_quantity != old_quantity
      self.product.update! level_of_stock: self.product.level_of_stock -= new_quantity - old_quantity
    end
  end

  # @return [BigDecimal]
  def price
    self.item_price * self.quantity
  end
end
