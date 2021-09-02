class Cart < ApplicationRecord
  has_many :cart_items
  has_many :items, through: :cart_items
  belongs_to :user

  def total_price
    price = 0
    cart_items.each do |i|
      price += i.item.price
    end
    price
  end

  def itemless?
    cart_items.count == 0
  end

  def trasher
    cart_items.destroy_all
  end
end
