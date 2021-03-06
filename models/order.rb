class Order < ActiveRecord::Base
  belongs_to :client
  has_many :order_items
  has_many :products, through: :order_items

  validates :order_items, :client, presence: true
  validates_associated :order_items

  scope :between_dates, -> (start_date, end_date) { where(created_at: start_date..end_date) }

  def self.most_expensive
    select('orders.*, sum(quantity*item_price) as total_price')
      .joins(:order_items)
      .group('orders.id')
      .order('total_price DESC')
      .first
  end

  def price
    #order_items.sum { |order_item| order_item.price }
    order_items.sum(&:price)
  end
end
