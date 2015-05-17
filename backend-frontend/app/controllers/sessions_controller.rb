class SessionsController < ApplicationController
  
  layout :false
  skip_before_action :require_login, except: :destroy

  def new
    redirect_to :home if current_user
  end

  def create
    respond_to do |format|
      if user = login(params[:customer_id], params[:password], params[:remeber_me])
        if current_user.first_time
          @url = edit_password_path(current_user)
        else
          @url = home_path
        end
      else
        flash.now[:notice] = 'Error en usuario o contraseña'
      end
      format.js
    end
  end

  def destroy
    logout
    redirect_to :root
  end
end
