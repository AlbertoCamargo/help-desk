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
    @user.first_time = false if @user.first_time
    unless @user.change_password!(params[:user][:password])
      render :edit
    else
      flash[:notice] = 'Su contraseña se ha actualizado correctamente'
      redirect_to :home
    end
  end
end
