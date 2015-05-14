class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login
  
  # Methods
  def not_authenticated
    redirect_to :login, notice: 'No estas autorizado para ralizar esta accion'
  end
end
