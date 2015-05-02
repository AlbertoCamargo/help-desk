class PasswordsController < ApplicationController
  
  def new
  end

  def create
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.password_confirmation = params[:user][:password_confirmation]
    @user.first_time = true unless @user.first_time
    unless @user.change_password!(params[:user][:password])
      flash.now[:notice] = 'Error en el password'
      render :edit
    else
      redirect_to :home, notice: 'Su contraseña se ha actualizado correctamente' 
    end
  end
end
