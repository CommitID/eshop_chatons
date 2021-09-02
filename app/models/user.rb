class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart
  has_many :order

  after_create :welcome_send
  after_create :create_user_cart

  def create_user_cart
    Cart.create(user_id: id)
  end

  def total_orders
    sum = 0
    order.each do |_i|
      sum += 1
    end
    sum
  end

  def orderless?
    total_orders == 0
  end

  def ordered
    order.order('updated_at').reverse
  end

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
