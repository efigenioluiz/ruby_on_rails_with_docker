class UserMailer < ApplicationMailer
  default from: 'no-reply@ifpr.local'

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/admins/sign_in'
    
    mail(to: @user.email, subject: 'Bem-vindo ao Sistema IFPR')
  end

end