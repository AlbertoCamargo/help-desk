class UserMailer < ApplicationMailer

  def activation_needed_email(user)
    @user = user
    @ulr = "http://localhost:3000/confirmations/#{user.activation_token}"
    
    mail to: user.email, subject: 'Bienvenido'    
  end

  def reset_password_email(user)
    @user = user
    @ulr = "http://localhost:3000/passwords/#{user.reset_password_token}/edit"
    
    mail to: user.email, subject: 'Resetear to contraseña' 
  end 
end
