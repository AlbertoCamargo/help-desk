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
      format.js
    end
  end

  def edit
    respond_to do |format|
      @incident = current_user.incidents.find(params[:id])
      format.js
    end
  end

  def update
    respond_to do |format|
      @incident.assign_attributes(params_incident)
      @incident.save
      format.js
    end
  end

  def destroy
    @incident.destroy
    redirect_to :home, notice: 'Se ha eliminado correctamente el incidente'
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
    @incident = current_user.incidents.find(params[:id])
  end

  def change_state(incident, state)
    incident.assign_attributes(state: state)
    incident.save
  end
end
