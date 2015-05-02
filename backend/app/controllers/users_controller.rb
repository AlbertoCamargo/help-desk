class UsersController < ApplicationController

  before_action :find_user, except: [:index, :new, :create]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      #@user.activate!
      redirect_to :home, notice: 'El usuario se a creado satisfactoriamente'
    else
      flash.now[:notice] = 'Error al crear el usuario'
      render :new
    end
  end

  def edit
  end

  def update
    @user.assign_attributes(params_user)
    if @user.save
      redirect_to :users, notice: 'El usuario se a actualizado correctamente'
    else
      flash.now[:notice] = 'Error al actualizar el usuario'
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to :users, notice: 'El usuario ha sido eliminado correctamente'
  end

  private
  def params_user
    params.require(:user).permit(:customer_id, :email, :phone, :rank, :full_name, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
