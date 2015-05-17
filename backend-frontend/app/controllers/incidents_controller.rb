class IncidentsController < ApplicationController
  
  before_action :find_incident, only: [:update, :destroy]

  def show
    @incident = current_user.is_customer? ? current_user.incidents.find(params[:id]) : Incident.find(params[:id])
    if @incident
      @comments_incidents = @incident.comments_incidents
      @comments_incident = CommentsIncident.new
    end
  end

  def new
    respond_to do |format|
      @incident = Incident.new
      format.js  
    end
  end

  def create
    respond_to do |format|
      @incident = current_user.incidents.build(params_incident)
      @incident.save
      flash[:notice] = 'Incidente creado exitosamente'
      format.js
    end
  end

  def edit
    respond_to do |format|
      @incident = Incidents.find(params[:id])
      format.js
    end
  end

  def update
    respond_to do |format|
      if current_user.creator_cases?(params[:id], 'incident') || current_user.is_sa?
        @incident.assign_attributes(params_incident)
        @incident.save
        flash[:notice] = 'Se ha actualizado correctamente el incidente'
        format.js
      else
        redirect_to :home
      end
    end
  end

  def destroy
    if current_user.creator_cases?(params[:id], 'incident') || current_user.is_sa?
      @incident.destroy
      flash[:notice] = 'Incidente eliminado correctamente'
    end
    redirect_to :home
  end

  def finished
    change_state(@incident, 'answered')
    redirect_to incident_path(params[:id])
  end

  def open
    change_state(@incident, 'active')
    redirect_to incident_path(params[:id])
  end

  private 
  def params_incident
    params.require(:incident).permit(:title, :description)
  end

  def find_incident
    @incident = Incident.find(params[:id])
  end

  def change_state(incident, state)
    incident.assign_attributes(state: state)
    incident.save
  end
end
