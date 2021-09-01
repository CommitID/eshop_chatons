class Cart < ApplicationRecord
  has_many :cart_items
  has_many :items, through: :cart_items
  belongs_to :user

  def total_items
    items = 0
    cart_items.each do |_i|
      items += 1
    end
    return '' if items == 0

    items
  end

  def total_price
    price = 0
    cart_items.each do |i|
      price += i.item.price
    end
    price
  end

  def itemless?
    cart_items.any?
  end
end
