class Order < ApplicationRecord
  has_many :order_items
  has_many :items, through: :order_items
  belongs_to :user

  def total_price
    price = 0
    order_items.each do |i|
      price += i.item.price
    end
    price
  end
end
