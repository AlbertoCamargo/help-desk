class ConfirmationsController < ApplicationController
  
  def show
    if user = User.load_from_activation_token(params[:id])
      user.activate!
    else
      redirect_to :root, notice: 'Token invalido'
    end
  end
end
