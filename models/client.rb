class Client < ActiveRecord::Base
  has_many :orders
  has_many :products, through: :orders
  has_many :order_items, through: :orders, source: 'order_items'

  def to_s
    "#{firstname} #{lastname}"
  end
end
