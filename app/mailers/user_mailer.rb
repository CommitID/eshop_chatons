class UserMailer < ApplicationMailer
  default from: 'rthp@fastmail.com'

  def welcome_email(user)
    @user = user

    @url  = 'http://psspsspss.herokuapp.com'

    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end
end
