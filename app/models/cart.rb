class Cart < ApplicationRecord
  has_many :cart_items
  has_many :items, through: :cart_items
  belongs_to :user

  def total
    sum = 0
    cart_items.each do |i|
      sum += i.item.price
    end
    sum
  end
end
