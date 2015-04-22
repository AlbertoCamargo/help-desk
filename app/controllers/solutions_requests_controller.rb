class SolutionsRequestsController < ApplicationController
  
  before_action :find_solutions_request, except: [:new, :create]

  def show
  end

  def new
    @solutions_request = SolutionsRequest.new
  end

  def create
    @solutions_request = current_user.solutions_requests.build(params_solutions_request)
    if @solutions_request.save
      redirect_to request_path(params[:solutions_request][:request_id]), notice: 'La solucion de la sugerencia se ha creado correctamente'
    else
      flash.now[:notice] = 'Error al crear la solucion'
      render :new
    end
  end

  def edit
  end

  def update
    @solutions_request.assign_attributes(params_solutions_request)
    if @solutions_request.save
      redirect_to request_path(params[:solutions_request][:request_id]), notice: 'La solucion de la sugerencia se ha actualizado correctamente'
    else
      flash.now[:notice] = 'Error al actualizar la solucion'
      render :edit
    end
  end

  def destroy
    @solutions_request.destroy
    redirect_to request_path(params[:solutions_request][:request_id]), notice: 'La solucion de la sugerencia se ha eliminado correctamente'
  end

  private
  def find_solutions_request 
    @solutions_request = SolutionsRequest.find(params[:id])
  end

  def params_solutions_request
    params.require(:solutions_request).permit(:description, :request_id)
  end

  def change_response_request(request_id)
    incidend = Request.find(request_id)
    request.assign_attributes(response: true)
    request.save
  end
end
