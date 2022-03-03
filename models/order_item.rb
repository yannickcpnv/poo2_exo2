class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  scope :bulk, ->(quantity = 100) { where('quantity >= ?', quantity) }

  before_create { self.item_price = product.price }
end
