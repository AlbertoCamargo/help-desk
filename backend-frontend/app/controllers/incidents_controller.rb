class IncidentsController < ApplicationController
  
  before_action :find_incident, only: [:update, :destroy]

  def show
    @incident = current_user.is_customer? ? current_user.incidents.find(params[:id]) : Incident.find(params[:id])
    if @incident
      @solutions_incidents = @incident.solutions_incidents 
      @solutions_incident = SolutionsIncident.new
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
      if @incident.save
        @url = :home
      end
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
      if @incident.save
        @url = :home
      end
      format.js
    end
  end

  def destroy
    @incident.destroy
    redirect_to :home, notice: 'Se ha eliminado correctamente el incidente'
  end

  private 
  def params_incident
    params.require(:incident).permit(:title, :description)
  end

  def find_incident
    @incident = current_user.incidents.find(params[:id])
  end
end
