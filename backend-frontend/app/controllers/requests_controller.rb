class RequestsController < ApplicationController
  
  before_action :find_request, except: [:show, :new, :create]

  def show
    @request = current_user.is_customer? ? current_user.requests.find(params[:id]) : Request.find(params[:id])
    if @request
      @solutions_requests = @request.solutions_requests 
      @solutions_request = SolutionsRequest.new
    end
  end

  def new
    @request = Request.new
  end

  def create
    respond_to do |format|
      @request = current_user.requests.build(params_request)
      if @request.save
        @url = :home
        #redirect_to :home, notice: 'La sugerencia se ha creado correctamente' 
      end
        #flash.now[:notice] = 'Error al crear la sugerencia'
        #render :new
      format.js  
    end
  end

  def edit
  end

  def update
    @request.assign_attributes(params_request)
    if @request.save
      redirect_to :home, notice: 'Se ha actualizado correctamente la sugerencia'
    else
      flash.now[:notice] = 'Error al actualizar al sugerencia'
      render :edit
    end
  end

  def destroy
    @request.destroy
    redirect_to :home, notice: 'Se ha eliminado correctamente la sugerencia'
  end

  private
  def params_request
    params.require(:request).permit(:title, :description)
  end

  def find_request
    @request = current_user.requests.find(params[:id])
  end
end
