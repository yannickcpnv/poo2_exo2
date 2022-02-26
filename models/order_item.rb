class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product, foreign_key: 'item_id'

  scope :bulk, ->(quantity = 100) { where('quantity >= ?', quantity) }

  before_create { self.item_price = product.price }
end
