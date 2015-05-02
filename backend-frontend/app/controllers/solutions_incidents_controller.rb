class SolutionsIncidentsController < ApplicationController
  
  before_action :find_solutions_incident, except: [:new, :create]

  def show
  end

  def new
    @solutions_incident = SolutionsIncident.new
  end

  def create
    @solutions_incident = current_user.solutions_incidents.build(params_solutions_incident)
    if @solutions_incident.save
      #change_response_incident(params[:solutions_incident][:incident_id])
      redirect_to incident_path(params[:solutions_incident][:incident_id]), notice: 'La solucion del incidente se ha creado correctamente'
    else
      flash.now[:notice] = 'Error al crear la solucion'
      render :new
    end
  end

  def edit
  end

  def update
    @solutions_incident.assign_attributes(params_solutions_incident)
    if @solutions_incident.save
      redirect_to incident_path(params[:solutions_incident][:incident_id]), notice: 'La solucion del incidente se ha actualizado correctamente'
    else
      flash.now[:notice] = 'Error al actualizar la solucion'
      render :edit
    end
  end

  def destroy
    @solutions_incident.destroy
    redirect_to incident_path(params[:solutions_incident][:incident_id]), notice: 'La solucion del incidente se ha eliminado correctamente'
  end

  private
  def find_solutions_incident 
    @solutions_incident = SolutionsIncident.find(params[:id])
  end

  def params_solutions_incident
    params.require(:solutions_incident).permit(:description, :incident_id)
  end

  def change_response_incident(incident_id)
    incidend = Incident.find(incident_id)
    incident.assign_attributes(response: true)
    incident.save
  end
end
