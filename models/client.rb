class Client < ActiveRecord::Base
  has_many :orders
  has_many :ordered_products, through: :orders, :source => :products
  validates :firstname, :lastname, presence: true, length: { minimum: 3 }

  def to_s
    "#{firstname} #{lastname}"
  end
end
