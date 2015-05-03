class SessionsController < ApplicationController
  
  layout :false
  skip_before_action :require_login, except: :destroy

  def new
    redirect_to :home if current_user
  end

  def create
    respond_to do |format|
      if user = login(params[:customer_id], params[:password], params[:remeber_me])
        unless current_user.first_time
          @url = edit_password_path(current_user)
          # redirect_to edit_password_path(current_user)
        else
          # redirect_to :home, notice: 'Sesion iniciada'
          @url = home_path
        end
      else
        flash.now[:notice] = 'Error en usuario o contraseña'
        #render :new
      end
      format.js
    end
  end

  def destroy
    logout
    redirect_to :root, notice: 'Sesion finalizada'
  end
end
