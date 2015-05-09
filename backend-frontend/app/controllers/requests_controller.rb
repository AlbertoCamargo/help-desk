class RequestsController < ApplicationController
  
  before_action :find_request, only: [:update, :destroy]

  def show
    @request = current_user.is_customer? ? current_user.requests.find(params[:id]) : Request.find(params[:id])
    if @request
      @comments_requests = @request.comments_requests
      @comments_request = CommentsRequest.new
    end
  end

  def new
    respond_to do |format|
      @request = Request.new
      format.js
    end
  end

  def create
    respond_to do |format|
      @request = current_user.requests.build(params_request)
      @request.save
      format.js  
    end
  end

  def edit
    respond_to do |format|
      @request = current_user.requests.find(params[:id])
      format.js
    end
  end

  def update
    respond_to do |format|
      @request.assign_attributes(params_request)
      @request.save
      format.js
    end
  end

  def destroy
    @request.destroy
    redirect_to :home, notice: 'Se ha eliminado correctamente la sugerencia'
  end

  def finished
    change_state(@request, 'answered')
    redirect_to request_path(params[:id])
  end

  def open
    change_state(@request, 'active')
    redirect_to request_path(params[:id])
  end

  private
  def params_request
    params.require(:request).permit(:title, :description)
  end

  def find_request
    @request = current_user.requests.find(params[:id])
  end

  def change_state(request, state)
    request.assign_attributes(state: state)
    request.save
  end
end
