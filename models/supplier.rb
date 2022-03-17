class Supplier < ActiveRecord::Base
  has_many :products
  has_many :categories, -> { distinct }, through: :products
end
