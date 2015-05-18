class HomesController < ApplicationController

  layout :false
  
  def index
    @problems = current_user.is_customer? ? current_user.problems.order(updated_at: :desc) : Problem.order(updated_at: :desc)
    @incidents = current_user.is_customer? ? current_user.incidents.order(updated_at: :desc) : Incident.order(updated_at: :desc)
    @requests = current_user.is_customer? ? current_user.requests.order(updated_at: :desc) : Request.order(updated_at: :desc)
    @problem = Problem.new
    @request = Request.new
    @incident = Incident.new
    stadistic
  end

  private
  def stadistic
    @data = {}
    @data[:num_problem] = current_user.is_customer? ? current_user.problems.count : Problem.count
    @data[:num_incident] = current_user.is_customer? ? current_user.incidents.count : Incident.count
    @data[:num_request] = current_user.is_customer? ? current_user.requests.count : Request.count
    @data[:problem_finished] = current_user.is_customer? ? current_user.problems.where(state: 'answered').count : Problem.where(state: 'answered').count
    @data[:incident_finished] = current_user.is_customer? ? current_user.incidents.where(state: 'answered').count : Incident.where(state: 'answered').count
    @data[:request_finished] = current_user.is_customer? ? current_user.requests.where(state: 'answered').count : Request.where(state: 'answered').count
  end
end
