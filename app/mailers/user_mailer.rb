class UserMailer < ApplicationMailer
  default from: 'rthp@fastmail.com'

  def welcome_email(user)
    @user = user

    @url  = 'http://psspsspss.herokuapp.com'

    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def order_email(user, order)
    @user = user
    @order = order

    # for @order.order_items.each do |oi|
    #  oi.picture
    # end

    @url = 'http://psspsspss.herokuapp.com'

    mail(to: @user.email, subject: "Commande ##{@order.id} sur psspsspss !")
  end
end
