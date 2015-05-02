class SessionsController < ApplicationController
  layout :false
  skip_before_action :require_login, except: :destroy

  def new
    redirect_to :home if current_user
  end

  def create
    if user = login(params[:customer_id], params[:password], params[:remeber_me])
      unless current_user.first_time
        redirect_to edit_password_path(current_user)
      else
        redirect_to :home, notice: 'Sesion iniciada'
      end   
    else
      flash.now[:notice] = 'Error en usuario o contraseña'
      render :new
    end
  end

  def destroy
    logout
    redirect_to :root, notice: 'Sesion finalizada'
  end
end
