class CommentsIncidentsController < ApplicationController
  
  before_action :find_comments_incident, except: [:new, :create]

  def new
    @comments_indicent = CommentsIncident.new
  end

  def create
    incident_id = params[:comments_incident][:incident_id]
    if Incident.find(incident_id).user = current_user || current_user.is_sa?
       @comments_incident = current_user.comments_incidents.build(params_comments_incident)
      if @comments_incident.save
        redirect_to incident_path(incident_id)
      else
        render :new
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    incident_id = params[:comments_incident][:incident_id]
    if Incident.find(incident_id).user = current_user || current_user.is_sa?
      @comments_incident.assign_attributes(params_comments_incident)
      if @comments_incident.save
        redirect_to incident_path(incident_id)
      else
        render :edit
      end
    else
      render :edit
    end
  end

  def destroy
    @comments_incident.destroy
    redirect_to incident_path([:incident_id])
  end

  private
  def find_comments_incident 
    @comments_incident = CommentsIncident.find(params[:id])
  end

  def params_comments_incident
    params.require(:comments_incident).permit(:description, :incident_id)
  end
end
