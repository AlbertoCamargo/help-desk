class CommentsIncidentsController < ApplicationController
  
  before_action :find_comments_incident, except: [:new, :create, :edit]

  def new
    respond_to do |format|
      @comments_indicent = CommentsIncident.new
      format.js
    end
  end

  def create
    respond_to do |format|
      incident_id = params[:comments_incident][:incident_id]
      if current_user.creator_cases?(incident_id, 'incident') || current_user.is_sa? || current_user.is_admin?
        @comments_incident = current_user.comments_incidents.build(params_comments_incident)
        if @comments_incident.save
          change_state(@comments_incident, 'active')
        end
      end
      format.js
    end
  end

  def edit
    respond_to do |format|
      @comments_incident = CommentsIncident.find(params[:id])
      format.js
    end
  end

  def update
    respond_to do |format|
      incident_id = params[:comments_incident][:incident_id]
      if current_user.creator_cases?(incident_id, 'incident') || current_user.is_sa? || current_user.is_admin?
        @comments_incident.assign_attributes(params_comments_incident)
        @comments_incident.save
      end
      format.js
    end
  end

  def destroy
    @comments_incident.destroy
    redirect_to incident_path(params[:incident_id])
  end

  private
  def find_comments_incident 
    @comments_incident = CommentsIncident.find(params[:id])
  end

  def params_comments_incident
    params.require(:comments_incident).permit(:description, :incident_id)
  end

  def change_state(comments_incident, state)
    incident = comments_incident.incident
    incident.assign_attributes(state: state)
    incident.save
  end
end
